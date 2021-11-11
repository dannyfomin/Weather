//
//  WeatherInteractorInput.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import Foundation

protocol WeatherInteractorInput {
    
    func getLocationsFromStorage()
    func getWeatherData(for locations: [LocationEntity])
    
}
