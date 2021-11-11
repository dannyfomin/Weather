//
//  WeatherConfigurator.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WeatherModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WeatherViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: WeatherViewController) {

        let router = WeatherRouter()

        let presenter = WeatherPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = WeatherInteractor()
        let storageService = LocationStorageService()
        let networkService = WeatherNetworkService()
        interactor.storageService = storageService
        interactor.networkService = networkService
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }
    
}
