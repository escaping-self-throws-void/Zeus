//
//  Network+Logger.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation
import OSLog

extension Network {
    private static let logger = Logger(
        subsystem: Bundle.main.bundleIdentifier ?? "N/A",
        category: String(describing: Self.self)
    )
    
    
    func log(request: URLRequest) {
#if DEBUG
        let urlAsString = request.url?.absoluteString ?? ""
        let urlComponents = NSURLComponents(string: urlAsString)
        let method = request.httpMethod != nil ? "\(request.httpMethod ?? "")" : ""
        let path = "\(urlComponents?.path ?? "")"
        let query = "\(urlComponents?.query ?? "")"
        let host = "\(urlComponents?.host ?? "")"
        let body = request.httpBody?.prettyPrintedJSONString
        
        var debugString = """
        \n--------------- OUTGOING ---------------\n
        \(urlAsString) \n\n
        \(method) \(path)?\(query)
        HOST: \(host)\n
        """
        
        request.allHTTPHeaderFields?.forEach {
            debugString += "\($0): \($1) \n"
        }
        
        if let body {
            debugString += "BODY: \(body) \n"
        }
        
        debugString += "\n--------------- END ---------------\n"
        
        Self.logger.info("\(debugString)")
#endif
    }
    
    func log(response: HTTPURLResponse, data: Data) {
#if DEBUG
        let urlString = response.url?.absoluteString
        let components = NSURLComponents(string: urlString ?? "")
        let path = "\(components?.path ?? "")"
        let query = "\(components?.query ?? "")"
        var output = "\n - - - - - - - - - - INCOMMING - - - - - - - - - - \n"
        
        if let urlString = urlString {
            output += "\(urlString)"
            output += "\n\n"
        }
        
        output += "HTTP \(response.statusCode) \(path)?\(query)\n"
        
        if let host = components?.host {
            output += "Host: \(host)\n"
        }
        for (key, value) in response.allHeaderFields {
            output += "\(key): \(value)\n"
        }
        
        output += "\n\(data.prettyPrintedJSONString ?? "Unable to pretty print")\n"
        output += "\n - - - - - - - - - -  END - - - - - - - - - - \n"
        
        Self.logger.info("\(output)")
#endif
    }
}
