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
