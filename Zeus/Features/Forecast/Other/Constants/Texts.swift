//
//  Texts.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation

enum Texts {
    enum Errors {
        static let errorTitle = NSLocalizedString("error_title", comment: "")
        static let noInternetConnection = NSLocalizedString("no_internet_connection", comment: "")
        static let invalidURL = NSLocalizedString("invalid_url", comment: "")
        static let invalidServerResponse = NSLocalizedString("invalid_server_response", comment: "")
        static let serverError = NSLocalizedString("server_error", comment: "")
        static let unauthorized = NSLocalizedString("unauthorized", comment: "")
        static let forbidden = NSLocalizedString("forbidden", comment: "")
        static let badRequest = NSLocalizedString("bad_request", comment: "")
    }
    enum Forecast {
        static let searchPlaceholder = NSLocalizedString("search_placeholder", comment: "")
    }
}
