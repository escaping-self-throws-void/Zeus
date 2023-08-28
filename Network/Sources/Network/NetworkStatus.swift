//
//  NetworkStatus.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import SystemConfiguration

struct NetworkStatus {
    static var isConnected: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) { unsafePointer in
            unsafePointer.withMemoryRebound(to: sockaddr.self, capacity: 1) { pointer in
                SCNetworkReachabilityCreateWithAddress(nil, pointer)
            }
        }

        guard let defaultRouteReachability else {
            return false
        }
        
        var flags: SCNetworkReachabilityFlags = []
        
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        if flags.isEmpty {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
