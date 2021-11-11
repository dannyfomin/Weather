//
//  WeatherNetworkService.swift
//  Weather
//
//  Created by Danila Fomin on 15.10.2021.
//

import Foundation

protocol WeatherNetworkServiceProtocol {
    
    func getWeatherData(locationName: String,
                        success: @escaping (LocationResponse) -> Void,
                        failure: @escaping (Error?) -> Void
    )
    
}

class WeatherNetworkService {
    
    private enum Constants {
        
        static let URL = "https://api.openweathermap.org/data/2.5/weather"
        static let API_KEY = "be9befe5053e51bd73133b22c5c106e1"
        static let UNITS = "metric"
        
    }
    
    private enum RequestParameters {
        
        static let Q = "q"
        static let APP_ID = "appid"
        static let UNITS = "units"
        
    }
    
}

extension WeatherNetworkService: WeatherNetworkServiceProtocol {
    
    func getWeatherData(locationName: String,
                        success: @escaping (LocationResponse) -> Void,
                        failure: @escaping (Error?) -> Void) {
        
        guard var components = URLComponents(string: Constants.URL) else { return }
        
        components.queryItems = [
            URLQueryItem(name: RequestParameters.Q, value: locationName),
            URLQueryItem(name: RequestParameters.APP_ID, value: Constants.API_KEY),
            URLQueryItem(name: RequestParameters.UNITS, value: Constants.UNITS)
        ]
        
        guard let url = components.url else { return }
        
        let session = URLSession.shared
        let request = URLRequest(url: url)
        
        session.dataTask(with: request) { data, response, error in
                        
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  let responseObject = try? JSONDecoder().decode(LocationResponse.self, from: data),
                  (200 ..< 300).contains(response.statusCode),
                  error == nil
            else {
                failure(error)
                return
            }
            
            success(responseObject)
            
        }.resume()
        
    }
    
}
