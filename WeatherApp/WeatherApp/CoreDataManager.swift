//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import CoreData

final class CoreDataManager {

    static let shared = CoreDataManager()

    let container: NSPersistentContainer

    var context: NSManagedObjectContext {
        container.viewContext
    }

    private init() {
        container = NSPersistentContainer(name: "WeatherCore")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed: \(error)")
            }
        }
    }

    func save() {
        if context.hasChanges {
            try? context.save()
        }
    }
}

