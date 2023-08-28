//
//  Stylable+UILabel.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public extension Stylable where Self: UILabel {
    @discardableResult
    func text(_ value: String?) -> Self {
        self.text = value

        return self
    }

    @discardableResult
    func font(_ value: UIFont) -> Self {
        self.font = value

        return self
    }

    @discardableResult
    func textAlignment(_ value: NSTextAlignment) -> Self {
        self.textAlignment = value

        return self
    }

    @discardableResult
    func textColor(_ value: UIColor) -> Self {
        self.textColor = value

        return self
    }

    @discardableResult
    func numberOfLines(_ value: Int) -> Self {
        self.numberOfLines = value

        return self
    }
    
    @discardableResult
    func adjustsFontSizeToFitWidth(_ value: Bool) -> Self {
        self.adjustsFontSizeToFitWidth = value

        return self
    }
    
    @discardableResult
    func minimumScaleFactor(_ value: CGFloat) -> Self {
        self.minimumScaleFactor = value

        return self
    }
}
