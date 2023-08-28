//
//  RealmService.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation
import RealmSwift

final class RealmService {
    private let realm = try! Realm()
    
    public func save(_ object: Weather) {
        let dbWeather = WeatherRealm()
        dbWeather.animation = object.animation
        dbWeather.city = object.city
        dbWeather.date = object.date
        dbWeather.temp = object.temp
        
        let dbDays = List<DayRealm>()
        object.forecast.forEach { day in
            let dbDay = DayRealm()
            dbDay.date = day.date
            dbDay.icon = day.icon
            dbDay.maxTemp = day.maxTemp
            dbDay.minTemp = day.minTemp
            dbDays.append(dbDay)
        }
        
        dbWeather.forecast = dbDays
        
        write {
            realm.add(dbWeather)
        }
    }
    
    public func deleteAll() {
        write {
            realm.deleteAll()
        }
    }
    
    public func readAll() -> Weather? {
        let dbWeather = realm.objects(WeatherRealm.self)
        
        guard let recent = dbWeather.last else {
            return nil
        }

        var days = [Day]()
        recent.forecast.forEach { dbDay in
            let day = Day(date: dbDay.date,
                          icon: dbDay.icon,
                          minTemp: dbDay.minTemp,
                          maxTemp: dbDay.maxTemp)
            days.append(day)
        }
        
        return Weather(animation: recent.animation,
                       city: recent.city,
                       date: recent.date,
                       temp: recent.temp,
                       forecast: days)
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            debugPrint(error)
        }
    }
}
