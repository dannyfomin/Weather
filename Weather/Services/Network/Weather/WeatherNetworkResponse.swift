//
//  WeatherNetworkResponse.swift
//  Weather
//
//  Created by Danila Fomin on 15.10.2021.
//

import Foundation

struct LocationResponse: Decodable {
    
    let name: String
    let main: WeatherResponse
    let weather: [WeatherDescriptionResponse]
    
}

struct WeatherResponse: Decodable {
    
    let temp: Double
    
}

struct WeatherDescriptionResponse: Decodable {
    
    let description: String
    let main: String
    
}
