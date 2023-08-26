//
//  NetworkError.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation

enum NetworkError: Error {
    case noInternetConnection
    case invalidURL
    case invalidServerResponse
    case invalidServerResponseWithStatusCode(Int)
    case serverError
    case unauthorized
    case forbidden
    case badRequest
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .noInternetConnection:
          return "It seems you're not online. Please verify your internet connectivity."
        case .invalidURL:
            return "Invalid URL address"
        case .invalidServerResponse:
            return "Failed to parse the response to HTTPResponse"
        case .invalidServerResponseWithStatusCode(let statusCode):
            return "The server response didn't fall in the given range Status Code is: \(statusCode)"
        case .serverError:
            return "We encounter a server issue. Please try again."
        case .unauthorized:
            return "You're not authorized to execute this request."
        case .forbidden:
            return "You're not authorized to execute this request. Please verify the token validity."
        case .badRequest:
            return "Bad Request, please verify your input."
        }
    }
}
