//
//  WeatherViewController.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var locations: [LocationEntity] = []

    var output: WeatherViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
}

extension WeatherViewController: WeatherViewInput {
    
    func setupInitialState() {}
    
    func reloadTableView(with locations: [LocationEntity]) {
        self.locations = locations
        tableView.reloadData()
    }
    
    func showFetchingErrorAlert() {
        let alert = UIAlertController(
            title: "Something went wrong!",
            message: "Error while fetching locatins from storage.",
            preferredStyle: .alert
        )
        self.present(alert, animated: true)
    }
    
}

extension WeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let location = locations[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherTableViewCell",
                                                 for: indexPath) as! WeatherTableViewCellInput
        
        cell.setupInitialState()
        cell.setData(location)

        return cell
        
    }
    
}
