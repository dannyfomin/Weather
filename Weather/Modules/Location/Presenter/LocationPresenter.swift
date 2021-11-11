//
//  LocationPresenter.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

class LocationPresenter: LocationModuleInput {
    
    var locationTextFieldValue: String?

    weak var view: LocationViewInput!
    var interactor: LocationInteractorInput!
    var router: LocationRouterInput!
    
}

extension LocationPresenter: LocationViewOutput {
    
    func doneButtonClicked() {
        guard let locationName = locationTextFieldValue else {
            return
        }
        
        interactor.saveNewLocationToStorage(locationName: locationName)
    }
    
    func locationTextFieldChanged(to text: String?) {
        locationTextFieldValue = text
    }
    
    func viewIsReady() {}
    
}

extension LocationPresenter: LocationInteractorOutput {
    
    func newLocationSavedToStorage() {
        router.dismiss()
    }
    
}
