//
//  BaseView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

/// Use only for Nibless Views
open class BaseView: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable,
                message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
    )
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
}
