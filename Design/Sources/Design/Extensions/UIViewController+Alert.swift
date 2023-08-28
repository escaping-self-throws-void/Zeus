//
//  UIViewController+Alert.swift
//  Zeus
//
//  Created by Paul Matar on 28/08/2023.
//

import UIKit

extension UIViewController {
    public func show(error: some Error) {
        let alertController = UIAlertController(error, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

    public func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
