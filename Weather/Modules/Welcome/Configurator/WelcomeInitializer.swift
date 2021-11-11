//
//  WelcomeInitializer.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WelcomeModuleInitializer: NSObject {

    @IBOutlet weak var welcomeViewController: WelcomeViewController!

    override func awakeFromNib() {

        let configurator = WelcomeModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: welcomeViewController)
    }

}
