//
//  ForecastPresenter.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

protocol ForecastPresenterView: AnyObject {
    func onSuccess(content: Weather)
    func onFailure(errorMessage: String)
}

@MainActor
final class ForecastPresenter {
    @Injected
    private var forecastRepository: ForecastRepository
    
    private var task: Task<Void, Never>?
    
    private weak var view: ForecastPresenterView?
    
    required init(view: ForecastPresenterView) {
        self.view = view
    }
    
    deinit {
        task?.cancel()
        task = nil
    }
}

// MARK: - Public methods
extension ForecastPresenter {
    public func getForecast() {
        Task {
            do {
                let weather = try await forecastRepository.get()
                view?.onSuccess(content: weather)
            } catch {
                view?.onFailure(errorMessage: error.localizedDescription)
            }
        }
    }
}
