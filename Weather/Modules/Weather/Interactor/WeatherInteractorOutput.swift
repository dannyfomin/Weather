//
//  WeatherInteractorOutput.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import Foundation

protocol WeatherInteractorOutput: AnyObject {
    
    func locationsFetchedFromStorage(_ locations: [LocationEntity])
    func locationsDidNotFetchedFromStorage()
    func weatherLoadedFromServer(_ locations: [LocationEntity])
    
}
