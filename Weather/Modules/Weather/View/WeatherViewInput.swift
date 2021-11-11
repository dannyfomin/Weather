//
//  WeatherViewInput.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

protocol WeatherViewInput: AnyObject {
    
    func setupInitialState()
    func reloadTableView(with locations: [LocationEntity])
    func showFetchingErrorAlert()
    
}
