//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Danila Fomin on 11.10.2021.
//

import Foundation
import UIKit

protocol WeatherTableViewCellInput: UITableViewCell {
    
    func setupInitialState()
    func setData(_ data: LocationEntity)
    
}

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var weatherView: UIView!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var weatherLabel: UILabel!
    
    private func setupWeatherView() {
        weatherView.layer.cornerRadius = 16
        weatherView.layer.shadowOffset = CGSize(width: 2, height: 8)
        weatherView.layer.shadowColor = UIColor.black.cgColor
        weatherView.layer.shadowOpacity = 0.22
        weatherView.layer.shadowRadius = 8
    }
    
    private func setDefaultValues() {
        temperatureLabel.text = nil
        descriptionLabel.text = nil
        locationLabel.text = nil
        weatherLabel.text = nil
    }
    
}

extension WeatherTableViewCell: WeatherTableViewCellInput {
    
    func setupInitialState() {
        setupWeatherView()
        setDefaultValues()
    }
    
    func setData(_ data: LocationEntity) {
        
        locationLabel.text = data.name
        
        guard let weather = data.weather else {
            return
        }
        
        temperatureLabel.text = "\(weather.temperature)°C"
        descriptionLabel.text = weather.description
        weatherLabel.text = weather.icon?.emoji
        
    }
    
}
