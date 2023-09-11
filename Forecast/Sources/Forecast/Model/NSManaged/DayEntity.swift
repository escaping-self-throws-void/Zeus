//
//  DayEntity+CoreDataClass.swift
//  Zeus
//
//  Created by Paul Matar on 11/09/2023.
//
//

import Foundation
import CoreData

@objc(DayEntity)
public class DayEntity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayEntity> {
        return NSFetchRequest<DayEntity>(entityName: "DayEntity")
    }

    @NSManaged public var date: Date
    @NSManaged public var icon: Int64
    @NSManaged public var maxTemp: Double
    @NSManaged public var minTemp: Double
    @NSManaged public var weather: WeatherEntity?
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        date = .now
    }
}
