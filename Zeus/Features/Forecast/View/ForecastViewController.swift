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
        dismissKeyboardOnTap()
        presenter.getSavedForecast()
    }
}

// MARK: - Private methods
extension ForecastViewController {
    private func configureSubviews() {
        view.backgroundColor = .white
        customView.searchBar.delegate = self
        locationService.onSuccess = { [weak self] location in
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            self?.presenter.getForecast(with: "\(lat),\(lon)")
        }
        locationService.onError = { errorMessage in
            print(errorMessage)
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.titleView = customView.searchBar
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: .init(systemName: "location"),
                                                           style: .done,
                                                           target: self,
                                                           action: #selector(locationTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                            target: self,
                                                            action: #selector(searchTapped))
    }
    
    private func dismissKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
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
}

// MARK: - ForecastPresenterView
extension ForecastViewController: ForecastPresenterView {
    func onSuccess(content: Weather) {
        customView.configure(with: content)
    }
    
    func onFailure(errorMessage: String) {
        
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
