//
//  ForecastViewController.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import UIKit

final class ForecastViewController: BaseViewController<ForecastView> {

    private let repo = ForecastRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

