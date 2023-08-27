//
//  Routable.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public protocol Routable: AnyObject {
    func push(_ viewController: UIViewController, isAnimated: Bool, onNavigateBack: VoidClosure?)
    func pop(_ isAnimated: Bool)
    func popToRoot(_ isAnimated: Bool)
    func present(_ viewController: UIViewController, isAnimated: Bool)
}
