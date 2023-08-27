//
//  AppCoordinator.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
     
    private let window: UIWindow
        
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        
        DIContainer.register(
            type: Routable.self,
            scope: .global,
            implementer: Router(navigationController: navigationController)
        )

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
                
        let coordinator = ForecastCoordinator()
        start(coordinator: coordinator)
    }
}
