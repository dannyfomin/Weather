//
//  Weather+CoreDataProperties.swift
//  Weather
//
//  Created by Danila Fomin on 12.10.2021.
//

import Foundation
import CoreData


extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var temperature: Int16
    @NSManaged public var summary: String?
    @NSManaged public var icon: String?
    @NSManaged public var location: Location?

}

extension Weather : Identifiable {

}
