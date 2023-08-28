//
//  Stylable+UIImageView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public extension Stylable where Self: UIImageView {
    @discardableResult
    func image(_ value: UIImage?) -> Self {
        self.image = value

        return self
    }
}
