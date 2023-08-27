//
//  Injected.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

@propertyWrapper
public struct Injected<Dependency> {
    
    private var dependency: Dependency
    
    public init(_ scope: Scope = .new) {
        guard let dependency = DIContainer.resolve(scope: scope, type: Dependency.self) else {
            fatalError("No dependency of type \(String(describing: Dependency.Type.self)) registered!")
        }
        
        self.dependency = dependency
    }
    
    public var wrappedValue: Dependency {
        get { dependency }
        mutating set { dependency = newValue }
    }
}
