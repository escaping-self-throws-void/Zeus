//
//  Texts.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import Foundation

enum Texts {
    enum Errors {
        static let errorTitle = NSLocalizedString("error_title", bundle: .module, comment: "")
        static let noInternetConnection = NSLocalizedString("no_internet_connection", bundle: .module, comment: "")
        static let invalidURL = NSLocalizedString("invalid_url", bundle: .module, comment: "")
        static let invalidServerResponse = NSLocalizedString("invalid_server_response", bundle: .module, comment: "")
        static let serverError = NSLocalizedString("server_error", bundle: .module, comment: "")
        static let unauthorized = NSLocalizedString("unauthorized", bundle: .module, comment: "")
        static let forbidden = NSLocalizedString("forbidden", bundle: .module, comment: "")
        static let badRequest = NSLocalizedString("bad_request", bundle: .module, comment: "")
    }
    enum Forecast {
        static let searchPlaceholder = NSLocalizedString("search_placeholder", bundle: .module, comment: "")
    }
}
