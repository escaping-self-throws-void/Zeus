//
//  BaseCoordinator.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

open class BaseCoordinator: Coordinator {
    public var childCoordinators = [Coordinator]()
    public var isCompleted: VoidClosure?
    
    public init() {}
    
    open func start() {
        preconditionFailure("Has to be overridden")
    }
    
    public func start(coordinator: BaseCoordinator) {
        childCoordinators.append(coordinator)
        coordinator.isCompleted = { [weak self, weak coordinator] in
            guard let coordinator else { return }
            self?.didFinish(coordinator: coordinator)
        }
        coordinator.start()
    }
    
    public func didFinish(coordinator: BaseCoordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
}
