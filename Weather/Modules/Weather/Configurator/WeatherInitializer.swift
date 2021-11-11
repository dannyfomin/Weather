//
//  WeatherInitializer.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WeatherModuleInitializer: NSObject {

    @IBOutlet weak var weatherViewController: WeatherViewController!

    override func awakeFromNib() {

        let configurator = WeatherModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: weatherViewController)
    }

}
