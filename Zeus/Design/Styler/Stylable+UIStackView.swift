//
//  Stylable+UIStackView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public extension Stylable where Self: UIStackView {
    @discardableResult
    func axis(_ value: NSLayoutConstraint.Axis) -> Self {
        self.axis = value

        return self
    }

    @discardableResult
    func distribution(_ value: UIStackView.Distribution) -> Self {
        self.distribution = value

        return self
    }
    
    @discardableResult
    func alignment(_ value: UIStackView.Alignment) -> Self {
        self.alignment = value

        return self
    }

    @discardableResult
    func spacing(_ value: CGFloat) -> Self {
        self.spacing = value

        return self
    }

    @discardableResult
    func isLayoutMarginsRelativeArrangement(_ value: Bool) -> Self {
        self.isLayoutMarginsRelativeArrangement = value

        return self
    }

    @discardableResult
    func directionalLayoutMargins(_ value: NSDirectionalEdgeInsets) -> Self {
        self.directionalLayoutMargins = value

        return self
    }
}

