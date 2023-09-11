//
//  WeatherEntity+CoreDataProperties.swift
//  Zeus
//
//  Created by Paul Matar on 11/09/2023.
//
//

import Foundation
import CoreData


@objc(WeatherEntity)
public class WeatherEntity: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherEntity> {
        return NSFetchRequest<WeatherEntity>(entityName: "WeatherEntity")
    }

    @NSManaged public var animation: String
    @NSManaged public var city: String
    @NSManaged public var date: Date
    @NSManaged public var temp: Double
    
    public var filteredForecast: [DayEntity] {
        let set = forecast as? Set<DayEntity> ?? []
        return set.sorted { $0.date < $1.date }
    }
    @NSManaged private var forecast: NSSet

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        animation = ""
        city = ""
        date = .now
        forecast = .init()
    }
}

// MARK: Generated accessors for forecast
extension WeatherEntity {

    @objc(addForecastObject:)
    @NSManaged public func addToForecast(_ value: DayEntity)

    @objc(removeForecastObject:)
    @NSManaged public func removeFromForecast(_ value: DayEntity)

    @objc(addForecast:)
    @NSManaged public func addToForecast(_ values: NSSet)

    @objc(removeForecast:)
    @NSManaged public func removeFromForecast(_ values: NSSet)
}
