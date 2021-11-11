//
//  LocationViewController.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, LocationViewInput {
    
    @IBOutlet private weak var locationTextField: UITextField!
    
    @IBAction private func doneButtonClicked(_ sender: UIBarButtonItem) {
        output.doneButtonClicked()
    }
    
    @IBAction func locationTextFieldChanged(_ sender: UITextField) {
        output.locationTextFieldChanged(to: locationTextField.text)
    }
    
    var output: LocationViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    func setupInitialState() {}

}
