//
//  WeatherInteractor.swift
//  Weather
//
//  Created by Danila Fomin on 07/10/2021.
//  Copyright © 2021 Open Solutions. All rights reserved.
//

import Foundation

class WeatherInteractor {

    weak var output: WeatherInteractorOutput!
    var storageService: LocationStorageServiceProtocol!
    var networkService: WeatherNetworkServiceProtocol!
    
    private func locationResponseToLocationEntity(
        _ locationResponse: LocationResponse,
        uri: URL?
    ) -> LocationEntity {
        
        let weather = WeatherEntity(
            temperature: Int(locationResponse.main.temp),
            description: locationResponse.weather.first?.description.capitalized,
            icon: WeatherIcon(rawValue: locationResponse.weather.first?.main ?? "")
        )
        
        return LocationEntity(
            uri: uri,
            name: locationResponse.name,
            weather: weather
        )
        
    }
    
}

extension WeatherInteractor: WeatherInteractorInput {
    
    func getLocationsFromStorage() {
        storageService.getLocations(success: { locations in
            output.locationsFetchedFromStorage(locations)
        }, failure: { error in
            output.locationsDidNotFetchedFromStorage()
            print("Could not fetch. \(error), \(error.userInfo).")
        })
    }
    
    func getWeatherData(for locations: [LocationEntity]) {
        
        var actualLocations: [LocationEntity] = []
        let dispatchGroup = DispatchGroup()
        
        for location in locations {
            dispatchGroup.enter()
            networkService.getWeatherData(
                locationName: location.name,
                success: { locationResponse in
                    actualLocations.append(
                        self.locationResponseToLocationEntity(locationResponse, uri: location.uri))
                    dispatchGroup.leave()
                }, failure: { error in
                    actualLocations.append(location)
                    dispatchGroup.leave()
                })
        }
        
        dispatchGroup.notify(queue: .main) {
            self.output.weatherLoadedFromServer(actualLocations)
        }
        
    }
    
}
