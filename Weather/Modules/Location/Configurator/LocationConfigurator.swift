//
//  LocationConfigurator.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class LocationModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LocationViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LocationViewController) {

        let router = LocationRouter()
        router.view = viewController

        let presenter = LocationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LocationInteractor()
        interactor.storageSevice = LocationStorageService()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
