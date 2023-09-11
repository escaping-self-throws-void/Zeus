//
//  CoreDataManager.swift
//  Zeus
//
//  Created by Paul Matar on 10/09/2023.
//

import CoreData
import Core

public final class CoreDataManager: NSPersistentContainer {
    
    init() {
        guard let objectModelURL = Bundle.module.url(forResource: "ForecastModel", withExtension: "momd"),
              let objectModel = NSManagedObjectModel(contentsOf: objectModelURL)
        else {
            fatalError("Failed to retrieve the object model")
        }
        super.init(name: "ForecastModel", managedObjectModel: objectModel)
        _init()
    }
    
    private func _init() {
        loadPersistentStores { description, error in
            if let error {
                fatalError("Failed to load CoreData: \(error)")
            }
            print("Core data loaded: \(description)")
        }
    }
}

// MARK: - WeatherStorage
extension CoreDataManager: WeatherStorage {
    public func fetch() -> Weather? {
        let fetchRequest = WeatherEntity.fetchRequest()
        guard let fetched = try? viewContext.fetch(fetchRequest).last else {
            return nil
        }
        let forecast = fetched.filteredForecast.map { entity in
            Day(
                date: entity.date,
                icon: Int(entity.icon),
                minTemp: entity.minTemp,
                maxTemp: entity.maxTemp
            )
        }
        return .init(
            animation: fetched.animation,
            city: fetched.city,
            date: fetched.date,
            temp: fetched.temp,
            forecast: forecast
        )
    }
    
    public func save(_ object: Weather) {
        let entity = WeatherEntity(context: viewContext)
        entity.animation = object.animation
        entity.city = object.city
        entity.date = object.date
        entity.temp = object.temp
        object.forecast.forEach { day in
            let dayEntity = DayEntity(context: viewContext)
            dayEntity.date = day.date
            dayEntity.icon = Int64(day.icon)
            dayEntity.minTemp = day.minTemp
            dayEntity.maxTemp = day.maxTemp
            entity.addToForecast(dayEntity)
        }
        
        saveContext()
    }
}

// MARK: - Private methods
extension CoreDataManager {
    private func saveContext() {
        guard viewContext.hasChanges else { return }
        
        do {
            try viewContext.save()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}

