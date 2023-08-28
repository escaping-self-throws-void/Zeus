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
    public func getForecast(with query: String) {
        Task {
            do {
                let weather = try await forecastRepository.fetchWeather(with: query)
                view?.onSuccess(content: weather)
            } catch {
                view?.onFailure(errorMessage: handle(error: error))
            }
        }
    }
    
    public func getSavedForecast() {
        guard let result = forecastRepository.fetchSavedWeather() else {
            return
        }
        view?.onSuccess(content: result)
    }
}

// MARK: - Private methods
extension ForecastPresenter {
    private func handle(error: Error) -> String {
        guard let networkError = error as? NetworkError else {
            return error.localizedDescription
        }
        
        switch networkError {
        case .noInternetConnection:
            return Texts.Errors.noInternetConnection
        case .invalidURL:
            return Texts.Errors.invalidURL
        case .invalidServerResponse:
            return Texts.Errors.invalidServerResponse
        case .serverError:
            return Texts.Errors.serverError
        case .unauthorized:
            return Texts.Errors.unauthorized
        case .forbidden:
            return Texts.Errors.forbidden
        default:
            return Texts.Errors.badRequest
        }
    }
}
