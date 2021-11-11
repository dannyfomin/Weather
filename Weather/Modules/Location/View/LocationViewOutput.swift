//
//  LocationViewOutput.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

protocol LocationViewOutput {

    func viewIsReady()
    func doneButtonClicked()
    func locationTextFieldChanged(to text: String?)
    
}
