//
//  ForecastCoordinator.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public final class ForecastCoordinator: BaseCoordinator {

    @Injected(.global)
    private var router: Routable
    
    public override init() {}

    public override func start() {
        registerDependencies()
        
        let forecastViewController = ForecastViewController()
        router.push(forecastViewController, isAnimated: true, onNavigateBack: isCompleted)
    }
}

// MARK: - Private methods
extension ForecastCoordinator {
    private func registerDependencies() {
        DIContainer.register(type: Networking.self, scope: .global, implementer: Network())
        DIContainer.register(type: LocationService.self, scope: .global, implementer: LocationService())
        DIContainer.register(type: ForecastRepository.self, implementer: ForecastRepository())
        DIContainer.register(type: WeatherMapper.self, implementer: WeatherMapper())
    }
}
