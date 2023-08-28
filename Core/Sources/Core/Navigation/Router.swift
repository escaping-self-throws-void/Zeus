//
//  Router.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public final class Router: NSObject {
    private let navigationController: UINavigationController
    private var closures: [AnyHashable: VoidClosure] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
}

// MARK: - Routable
extension Router: Routable {
    public func push(_ viewController: UIViewController, isAnimated: Bool, onNavigateBack closure: VoidClosure?) {
        if let closure {
            closures.updateValue(closure, forKey: ObjectIdentifier(viewController))
        }
        navigationController.pushViewController(viewController, animated: isAnimated)
    }
    
    public func pop(_ isAnimated: Bool) {
        guard let viewController = navigationController.popViewController(animated: isAnimated) else {
            return
        }
        executeClosure(viewController)
    }
    
    public func popToRoot(_ isAnimated: Bool) {
        guard let viewControllers = navigationController.popToRootViewController(animated: isAnimated) else {
            return
        }
        
        viewControllers.forEach { executeClosure($0) }
    }
    
    public func present(_ viewController: UIViewController, isAnimated: Bool) {
        navigationController.present(viewController, animated: isAnimated)
    }
}

// MARK: - UINavigationControllerDelegate
extension Router: UINavigationControllerDelegate {
    public func navigationController(
        _ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool
    ) {
        guard let previousController = navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(previousController) else {
            return
        }
        executeClosure(previousController)
    }
}

// MARK: - Private methods
extension Router {
    private func executeClosure(_ viewController: UIViewController) {
        if let closure = closures.removeValue(forKey: ObjectIdentifier(viewController)) {
            closure()
        }
    }
}
