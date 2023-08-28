//
//  ForecastPresenter.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation
import Network
import Core

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
    private var latestFetched: Weather?
    private var isCelsius = true
    
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
                latestFetched = weather
                view?.onSuccess(content: weather)
            } catch {
                view?.onFailure(errorMessage: handle(error: error))
            }
        }
    }
    
    public func getSavedForecast() {
        guard let weather = forecastRepository.fetchSavedWeather() else {
            return
        }
        latestFetched = weather
        view?.onSuccess(content: weather)
    }
    
    public func reload() {
        guard let latestFetched else {
            return
        }
        
        isCelsius.toggle()
        let content: Weather
        
        if isCelsius {
            content = latestFetched
        } else {
            content = Weather(
                animation: latestFetched.animation,
                city: latestFetched.city,
                date: latestFetched.date,
                temp: latestFetched.temp.celsiusToFahrenheit,
                forecast: latestFetched.forecast.map { day in
                    Day(date: day.date,
                        icon: day.icon,
                        minTemp: day.minTemp.celsiusToFahrenheit,
                        maxTemp: day.maxTemp.celsiusToFahrenheit)
                }
            )
        }
        view?.onSuccess(content: content)
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
