//
//  LocationStorageService.swift
//  Weather
//
//  Created by Danila Fomin on 12.10.2021.
//

import Foundation
import CoreData

protocol LocationStorageServiceProtocol {
    
    func saveLocation(
        _ location: LocationEntity,
        success: () -> Void,
        failure: (NSError) -> Void
    )
    func getLocations(
        success: ([LocationEntity]) -> Void,
        failure: (NSError) -> Void
    )
    func cacheLocations(
        _ locations: [LocationEntity],
        success: @escaping () -> Void,
        failure: @escaping (NSError) -> Void
    )
    
}

class LocationStorageService: StorageService {
    
    private func storedLocationToLocationEntity(_ storedLocation: Location) -> LocationEntity {
        
        return LocationEntity(
            uri: storedLocation.objectID.uriRepresentation(),
            name: storedLocation.name,
            weather: storedWeatherToWeatherEntity(storedLocation.weather)
        )
        
    }
    
    private func storedWeatherToWeatherEntity(_ storedWeather: Weather?) -> WeatherEntity? {
        
        guard let storedWeather = storedWeather else {
            return nil
        }

        return WeatherEntity(
            temperature: Int(storedWeather.temperature),
            description: storedWeather.summary,
            icon: WeatherIcon(rawValue: storedWeather.icon ?? "")
        )
        
    }
    
}

extension LocationStorageService: LocationStorageServiceProtocol {
    
    func saveLocation(_ location: LocationEntity,
                      success: () -> Void,
                      failure: (NSError) -> Void) {
        
        guard let managedContext = getManagedObjectContext(
            contextType: .mainQueueConcurrencyType) else { return }
        
        let locationManagedObject = Location(context: managedContext)
        
        locationManagedObject.name = location.name
        
        saveManagedObjectContext(
            managedContext,
            success: success,
            failure: failure
        )
        
    }
    
    func getLocations(success: ([LocationEntity]) -> Void,
                      failure: (NSError) -> Void) {
        
        guard let managedContext = getManagedObjectContext(
            contextType: .mainQueueConcurrencyType) else { return }
        
        let fetchRequest: NSFetchRequest<Location> = Location.fetchRequest()
        
        do {
            let storedLocations = try managedContext.fetch(fetchRequest)
            
            let locations = storedLocations.map { storedLocation in
                return storedLocationToLocationEntity(storedLocation)
            }
            
            success(locations)
        } catch let error as NSError {
            failure(error)
        }
        
    }
    
    func cacheLocations(_ locations: [LocationEntity],
                        success: @escaping () -> Void,
                        failure: @escaping (NSError) -> Void) {
        
        guard let mainContext = getManagedObjectContext(
            contextType: .mainQueueConcurrencyType),
              let backgroundContext = getManagedObjectContext(
            contextType: .privateQueueConcurrencyType)
        else { return }
        
        backgroundContext.parent = mainContext
        
        backgroundContext.perform {
            
            do {
                for location in locations {
                    
                    guard let weather = location.weather,
                          let storedLocationUri = location.uri,
                          let storedLocationId = backgroundContext.persistentStoreCoordinator?.managedObjectID(
                        forURIRepresentation: storedLocationUri),
                          let storedLocation = try backgroundContext.existingObject(
                        with: storedLocationId) as? Location
                    else { continue }
                    
                    storedLocation.weather?.temperature = Int16(weather.temperature)
                    storedLocation.weather?.summary = weather.description
                    storedLocation.weather?.icon = weather.icon?.rawValue
                    
                }
            } catch let error as NSError {
                failure(error)
            }
            
            do {
                try backgroundContext.save()
                mainContext.perform {
                    do {
                        try mainContext.save()
                        success()
                    } catch let error as NSError {
                        failure(error)
                    }
                }
            } catch let error as NSError {
                failure(error)
            }
            
        }
        
    }
    
}
