//
//  Coordinator.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

public protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
