//
//  WelcomeViewController.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, WelcomeViewInput {

    var output: WelcomeViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {}
    
}
