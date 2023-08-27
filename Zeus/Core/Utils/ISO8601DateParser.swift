//
//  ISO8601DateParser.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public final class ISO8601DateParser {
    private static var calendarCache = [Int : Calendar]()
    private static var components = DateComponents()
    
    private static let year = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let month = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let day = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let hour = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let minute = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let second = UnsafeMutablePointer<Float>.allocate(capacity: 1)
    private static let hourOffset = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    private static let minuteOffset = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    
    public static func parse(_ dateString: String) -> Date? {
        let parseCount = withVaList([year, month, day, hour, minute, second, hourOffset, minuteOffset]) { pointer in
            vsscanf(dateString, "%d-%d-%dT%d:%d:%f%d:%dZ", pointer)
        }
        
        components.year = year.pointee
        components.minute = minute.pointee
        components.day = day.pointee
        components.hour = hour.pointee
        components.month = month.pointee
        components.second = Int(second.pointee)
        
        if hourOffset.pointee < 0 {
            minuteOffset.pointee = -minuteOffset.pointee
        }
        
        let offset = parseCount <= 6
        ? 0
        : hourOffset.pointee * 3600 + minuteOffset.pointee * 60
        
        if let calendar = calendarCache[offset] {
            return calendar.date(from: components)
        }
        
        var calendar = Calendar(identifier: .gregorian)
        guard let timeZone = TimeZone(secondsFromGMT: offset) else { return nil }
        calendar.timeZone =  timeZone
        calendarCache[offset] = calendar
        return calendar.date(from: components)
    }
}
