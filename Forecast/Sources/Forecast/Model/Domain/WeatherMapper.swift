//
//  WeatherMapper.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

struct WeatherMapper {
    func map(_ remote: WeatherResponse) -> Weather {
        let prefix = remote.current.isDay == 1 ? "day_" : "night_"
        let suffix = ConditionList.getAnimation(by: remote.current.condition.code)
        
        let animation = prefix + suffix
        
        return Weather(
            animation: animation,
            city: remote.location.name,
            date: .now,
            temp: remote.current.tempC,
            forecast: remote.forecast.forecastday.map { forecast in
                Day(
                    date: Date(timeIntervalSince1970: TimeInterval(forecast.dateEpoch)),
                    icon: ConditionList.getIconCode(by: forecast.day.condition.code),
                    minTemp: forecast.day.mintempC,
                    maxTemp: forecast.day.maxtempC
                )
            }
        )
    }
}
