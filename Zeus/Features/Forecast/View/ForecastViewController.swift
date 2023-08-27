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
        configureView()
//        Task {
//            do {
//                let r = try await repo.get()
//                dump(r)
//            } catch {
//                debugPrint(error)
//            }
//        }
        
    
    }
}

// MARK: - Private methods
extension ForecastViewController {
    private func configureView() {
        customView.configure(with:
                .init(
                    animation: "animation1",
                    currentCity: "BERLIN",
                    currentDate: "MON, 11AM",
                    currentTemp: "27",
                    firstDay: .init(date: "TUE", icon: .init(named: "143"), temp: "25° / 12°"),
                    secondDay: .init(date: "WED", icon: .init(named: "119"), temp: "21° / 14°"),
                    thirdDay: .init(date: "THU", icon: .init(named: "230"), temp: "24° / 12°")
                )
        )
    }
}
