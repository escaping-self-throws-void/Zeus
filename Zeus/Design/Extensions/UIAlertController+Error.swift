//
//  UIAlertController+Error.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import UIKit

extension UIAlertController {
    public convenience init(_ error: some Error, preferredStyle: UIAlertController.Style) {
        var title: String?
        var message: String?
        
        if let locError = error as? LocalizedError {
            title = locError.errorDescription
            message = [
                locError.failureReason,
                locError.recoverySuggestion
            ].compactMap { $0 }.joined(separator: "\n\n")
        } else {
            title = "Error"
            message = error.localizedDescription
        }
        
        self.init(title: title, message: message, preferredStyle: preferredStyle)
    }
}
