//
//  WeatherPresenter.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

class WeatherPresenter: WeatherModuleInput {

    weak var view: WeatherViewInput!
    var interactor: WeatherInteractorInput!
    var router: WeatherRouterInput!

}

extension WeatherPresenter: WeatherViewOutput {
    
    func viewIsReady() {
        view.setupInitialState()
        interactor.getLocationsFromStorage()
    }
    
}

extension WeatherPresenter: WeatherInteractorOutput {
    
    func locationsFetchedFromStorage(_ locations: [LocationEntity]) {
        view.reloadTableView(with: locations)
        interactor.getWeatherData(for: locations)
    }
    
    func locationsDidNotFetchedFromStorage() {
        view.showFetchingErrorAlert()
    }
    
    func weatherLoadedFromServer(_ locations: [LocationEntity]) {
        view.reloadTableView(with: locations)
    }
    
}
