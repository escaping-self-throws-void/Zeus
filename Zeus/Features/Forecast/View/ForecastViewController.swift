//
//  ForecastViewController.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import UIKit

final class ForecastViewController: BaseViewController<ForecastView> {

    private lazy var presenter = ForecastPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        presenter.getForecast()
    }
}

// MARK: - Private methods
extension ForecastViewController {
    private func configureView(with content: Weather) {
        customView.configure(with: content)
    }
}

// MARK: - ForecastPresenterView
extension ForecastViewController: ForecastPresenterView {
    func onSuccess(content: Weather) {
        configureView(with: content)
    }
    
    func onFailure(errorMessage: String) {
        
    }
}
