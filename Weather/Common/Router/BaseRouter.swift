//
//  BaseRouter.swift
//  Weather
//
//  Created by Danila Fomin on 08.10.2021.
//

import Foundation
import UIKit

class BaseRouter: BaseRouterInput {
    
    weak var view: UIViewController!
    
    func dismiss() {
        if let navigationController = view.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            view.dismiss(animated: true, completion: nil)
        }
    }
    
}
