//
//  LocationService.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation
import CoreLocation

final class LocationService: NSObject {
    public var onSuccess: Closure<CLLocation>?
    public var onError: Closure<String>?
    
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.requestAlwaysAuthorization()
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        manager.stopUpdatingLocation()
        onSuccess?(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onError?(error.localizedDescription)
    }
}

// MARK: - Public methods
extension LocationService {
    public func requestLocation() {
        manager.requestLocation()
    }
}
