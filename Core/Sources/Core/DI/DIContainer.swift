//
//  DIContainer.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

final public class DIContainer {
    private static var cache: [String: Any] = [:]
    private static var generators: [String: () -> Any] = [:]
    
    public static func register<Dependency>(
        type: Dependency.Type,
        scope: Scope = .automatic,
        implementer generator: @autoclosure @escaping () -> Dependency
    ) {
        let key = String(describing: type.self)
        generators[key] = generator
        
        if scope == .global {
            cache[key] = generator()
        }
    }
    
    public static func resolve<Dependency>(
        scope: Scope = .automatic,
        type: Dependency.Type
    ) -> Dependency? {
        let key = String(describing: type.self)
        
        switch scope {
        case .global:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            } else {
                fatalError("\(key) is not registered as singleton")
            }
        case .automatic:
            if let cachedDependency = cache[key] as? Dependency {
                return cachedDependency
            }
            fallthrough
        case .new:
            if let dependency = generators[key]?() as? Dependency {
                cache[key] = dependency
                return dependency
            } else {
                return nil
            }
        }
    }
}
