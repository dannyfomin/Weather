//
//  LocationInteractor.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

class LocationInteractor: LocationInteractorInput {
    
    var storageSevice: LocationStorageServiceProtocol!

    weak var output: LocationInteractorOutput!

    func saveNewLocationToStorage(locationName: String) {
        
        let location = LocationEntity(
            uri: nil,
            name: locationName,
            weather: nil
        )
        
        storageSevice.saveLocation(location,
                                   success: {
            output.newLocationSavedToStorage()
        }, failure: { error in
            print("Could not save. \(error), \(error.userInfo).")
        })
        
    }
    
}
