//
//  File.swift
//  
//
//  Created by Paul Matar on 28/08/2023.
//

import UIKit

public extension UIFont {
    class func plexSansMedium(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansSemiBold(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansExtraLight(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansThin(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-ExtraLight", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansLight(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-Light", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansRegular(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    class func plexSansBold(size: CGFloat) -> UIFont {
        .init(name: "IBMPlexSans-Bold", size: size) ?? .systemFont(ofSize: size)
    }
}
