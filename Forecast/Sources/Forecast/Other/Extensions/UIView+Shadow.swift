//
//  File.swift
//  
//
//  Created by Paul Matar on 28/08/2023.
//

import UIKit

extension UIView {
    func dropShadow(
        color: UIColor = .black,
        opacity: Float = 0.5,
        offset: CGSize = .init(width: 2, height: 2),
        radius: CGFloat = 4
    ) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
    }
}
