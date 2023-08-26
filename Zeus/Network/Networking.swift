//
//  Networking.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import Foundation

public protocol Networking {
    func perform<T: Decodable>(_ request: some NetworkRequest) async throws -> T
    func fetch(from url: URL) async throws -> Data
}

