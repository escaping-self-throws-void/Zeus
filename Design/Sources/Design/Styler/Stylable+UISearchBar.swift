//
//  Stylable+UISearchBar.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

public extension Stylable where Self: UISearchBar {
    @discardableResult
    func text(_ value: String?) -> Self {
        self.text = value
        
        return self
    }
    
    @discardableResult
    func tintColor(_ value: UIColor) -> Self {
        self.tintColor = value
        
        return self
    }
    
    @discardableResult
    func barTintColor(_ value: UIColor) -> Self {
        self.barTintColor = value
        
        return self
    }
    
    @discardableResult
    func capitalizationType(_ value: UITextAutocapitalizationType) -> Self {
        self.autocapitalizationType = value
        
        return self
    }
    
    @discardableResult
    func keyboardType(_ value: UIKeyboardType) -> Self {
        self.keyboardType = value
        
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ value: Bool) -> Self {
        self.isSecureTextEntry = value

        return self
    }

    @discardableResult
    func autocorrectionType(_ value: UITextAutocorrectionType) -> Self {
        self.autocorrectionType = value

        return self
    }

    @discardableResult
    func contentType(_ value: UITextContentType?) -> Self {
        self.textContentType = value

        return self
    }

    @discardableResult
    func placeholder(_ value: String?) -> Self {
        self.placeholder = value

        return self
    }

    @discardableResult
    func returnKeyType(_ value: UIReturnKeyType) -> Self {
        self.returnKeyType = value

        return self
    }
    
    @discardableResult
    func delegate(_ value: UISearchBarDelegate) -> Self {
        self.delegate = value

        return self
    }
}
