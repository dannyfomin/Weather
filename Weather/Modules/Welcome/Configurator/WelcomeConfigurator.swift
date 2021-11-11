//
//  WelcomeConfigurator.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WelcomeModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? WelcomeViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: WelcomeViewController) {

        let router = WelcomeRouter()

        let presenter = WelcomePresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = WelcomeInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
        
    }
}
