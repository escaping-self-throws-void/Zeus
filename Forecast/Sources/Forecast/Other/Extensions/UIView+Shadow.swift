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
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = window?.windowScene?.screen.scale ?? UIScreen.main.scale
    }
}
