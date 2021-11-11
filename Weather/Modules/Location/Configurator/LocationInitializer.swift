//
//  LocationInitializer.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class LocationModuleInitializer: NSObject {

    @IBOutlet weak var locationViewController: LocationViewController!

    override func awakeFromNib() {

        let configurator = LocationModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: locationViewController)
    }

}
