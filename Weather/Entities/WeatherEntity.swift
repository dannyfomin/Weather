//
//  WeatherEntity.swift
//  Weather
//
//  Created by Danila Fomin on 08.10.2021.
//

import Foundation

enum WeatherIcon: String {
    
    case drizzle = "Drizzle"
    case thunderstorm = "Thunderstorm"
    case rain = "Rain"
    case snow = "Snow"
    case clear = "Clear"
    case clouds = "Clouds"
    
}

extension WeatherIcon {
    
    var emoji: String {
        switch self {
        case .drizzle:
            return "🌨"
        case .thunderstorm:
            return "⛈"
        case .rain:
            return "🌧"
        case .snow:
            return "❄️"
        case .clear:
            return "☀️"
        case .clouds:
            return "☁️"
        }
    }
    
}

struct WeatherEntity {
    
    let temperature: Int
    let description: String?
    let icon: WeatherIcon?
    
}
