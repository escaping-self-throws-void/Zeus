//
//  ForecastViewController.swift
//  Zeus
//
//  Created by Paul Matar on 26/08/2023.
//

import UIKit

final class ForecastViewController: BaseViewController<ForecastView> {
    // MARK: - Properties
    @Injected
    private var locationService: LocationService
    private lazy var presenter = ForecastPresenter(view: self)
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        configureNavigationBar()
        presenter.getSavedForecast()
    }
}

// MARK: - Private methods
extension ForecastViewController {
    private func configureSubviews() {
        view.backgroundColor = .bg
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        dismissGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(dismissGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tempTapped))
        customView.tempLabel.isUserInteractionEnabled = true
        customView.tempLabel.addGestureRecognizer(tapGesture)
        customView.searchBar.delegate = self
        
        locationService.onError = { [weak self] errorMessage in
            self?.showAlert(title: Texts.Errors.errorTitle, message: errorMessage)
        }
        locationService.onSuccess = { [weak self] location in
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            self?.presenter.getForecast(with: "\(lat),\(lon)")
        }
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .berlin
        navigationItem.titleView = customView.searchBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "location"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(locationTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchTapped))
    }
}

// MARK: - Actions
extension ForecastViewController {
    @objc
    private func searchTapped() {
        customView.searchBar.resignFirstResponder()
        guard let text = customView.searchBar.text,
              !text.isEmpty else {
            return
        }
        presenter.getForecast(with: text)
    }
    
    @objc
    private func locationTapped() {
        locationService.requestLocation()
    }
    
    @objc
    private func hideKeyboard() {
        customView.searchBar.resignFirstResponder()
    }
    
    @objc
    private func tempTapped() {
        presenter.reload()
    }
}

// MARK: - ForecastPresenterView
extension ForecastViewController: ForecastPresenterView {
    func onSuccess(content: Weather) {
        customView.configure(with: content)
    }
    
    func onFailure(errorMessage: String) {
        showAlert(title: Texts.Errors.errorTitle, message: errorMessage)
    }
}

// MARK: - UISearchBarDelegate
extension ForecastViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchBar.text,
              !text.isEmpty else {
            return
        }
        presenter.getForecast(with: text)
    }
}
