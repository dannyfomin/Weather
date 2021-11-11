//
//  Location+CoreDataProperties.swift
//  Weather
//
//  Created by Danila Fomin on 12.10.2021.
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var name: String
    @NSManaged public var weather: Weather?

}

extension Location : Identifiable {

}
