//
//  ForecastView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

final class ForecastView: BaseView {
    // MARK: - Outlets
    private lazy var todayLabel = UILabel()
        .numberOfLines(2)
        .textAlignment(.center)
    private lazy var tempLabel = UILabel()
        .font(.monospacedSystemFont(ofSize: 250, weight: .bold))
    private let firstDayView = DailyForecastView()
    private let secondDayView = DailyForecastView()
    private let thirdDayView = DailyForecastView()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
}

// MARK: - Configuration
extension ForecastView {
    struct Configuration {
        let currentCity: String
        let currentDate: String
        let currentTemp: String
        
        let firstDay: DailyForecastView.Configuration
        let secondDay: DailyForecastView.Configuration
        let thirdDay: DailyForecastView.Configuration
    }
    public func configure(with config: Configuration) {
        todayLabel.attributedText = makeAttributedText(from: config.currentCity, date: config.currentDate)
        tempLabel.text = config.currentTemp
        
        firstDayView.configure(with: config.firstDay)
        secondDayView.configure(with: config.secondDay)
        thirdDayView.configure(with: config.thirdDay)
    }
}

// MARK: - Private methods
extension ForecastView {
    private func _init() {
        addSubviews(todayLabel, tempLabel)
        
        todayLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide)
                .inset(30)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let stack = UIStackView(arrangedSubviews: [
            firstDayView,
            secondDayView,
            thirdDayView
        ])
            .axis(.vertical)
            .spacing(10)
        
        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.greaterThanOrEqualTo(tempLabel.snp.bottom).inset(30)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
    }
    
    private func makeAttributedText(from city: String, date: String) -> NSMutableAttributedString {
        let cityAttrString = NSAttributedString(string: city, attributes: [.foregroundColor: UIColor.darkGray])
        let finalString = NSMutableAttributedString(attributedString: cityAttrString)
        let dateAttrString = NSAttributedString(string: "\n\(date)", attributes: [.foregroundColor: UIColor.gray])
        finalString.append(dateAttrString)
        return finalString
    }
}
