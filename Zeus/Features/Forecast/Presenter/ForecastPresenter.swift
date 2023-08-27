//
//  ForecastPresenter.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import Foundation

protocol ForecastPresenterView: AnyObject {
    func onSuccess()
    func onFailure(errorMessage: String)
}

final class ForecastPresenter {
    @Injected
    private var forecastRepository: ForecastRepository
    
    private weak var view: ForecastPresenterView?
    
    required init(view: ForecastPresenterView) {
        self.view = view
    }
}
