//
//  Stylable+UIControl.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public extension Stylable where Self: UIControl {
    @discardableResult
    func action(_ value: VoidClosure?, event: UIControl.Event = .touchUpInside) -> Self {
        let identifier = UIAction.Identifier(String(describing: event.rawValue))
        let action = UIAction(identifier: identifier) { _ in
            value?()
        }

        self.removeAction(identifiedBy: identifier, for: event)
        self.addAction(action, for: event)

        return self
    }

    @discardableResult
    func secondAction(_ value: Closure<Bool>?, controlEvent: UIControl.Event = .valueChanged) -> Self {
        let identifier = UIAction.Identifier(String(describing: controlEvent.rawValue))
        let action = UIAction(identifier: identifier) { item in
            guard let control = item.sender as? UIControl else {
                return
            }
            value?(!control.isTracking)
        }

        self.removeAction(identifiedBy: identifier, for: controlEvent)
        self.addAction(action, for: controlEvent)

        return self
    }

    @discardableResult
    func isEnabled(_ value: Bool) -> Self {
        self.isEnabled = value

        return self
    }

    @discardableResult
    func isUserInteractionEnabled(_ value: Bool) -> Self {
        self.isUserInteractionEnabled = value

        return self
    }

    @discardableResult
    func tintColor(_ value: UIColor) -> Self {
        self.tintColor = value

        return self
    }
}

public typealias VoidClosure = () -> Void
public typealias Closure<T> = (T) -> Void
