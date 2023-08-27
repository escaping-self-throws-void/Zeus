//
//  UIView+SnapKit.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit
import SnapKit

public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
