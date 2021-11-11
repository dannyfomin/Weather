//
//  WelcomePresenter.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

class WelcomePresenter: WelcomeModuleInput, WelcomeViewOutput, WelcomeInteractorOutput {

    weak var view: WelcomeViewInput!
    var interactor: WelcomeInteractorInput!
    var router: WelcomeRouterInput!

    func viewIsReady() {}
}
