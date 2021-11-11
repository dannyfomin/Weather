//
//  StorageService.swift
//  Weather
//
//  Created by Danila Fomin on 08.10.2021.
//

import Foundation
import UIKit
import CoreData

class StorageService {
    
    func getManagedObjectContext(
        contextType: NSManagedObjectContextConcurrencyType) -> NSManagedObjectContext? {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else { return nil }
        
        switch contextType {
        case .mainQueueConcurrencyType:
            return appDelegate.persistentContainer.viewContext
        case .privateQueueConcurrencyType:
            return appDelegate.persistentContainer.newBackgroundContext()
        default:
            return nil
        }
        
    }
    
    func saveManagedObjectContext(_ managedObjectContext: NSManagedObjectContext,
                                  success: () -> Void,
                                  failure: (NSError) -> Void) {
        
        do {
            try managedObjectContext.save()
            success()
        } catch let error as NSError {
            failure(error)
        }
        
    }
    
}
