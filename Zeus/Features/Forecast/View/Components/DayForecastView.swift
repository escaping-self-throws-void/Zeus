//
//  DayForecastView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

final class DayForecastView: BaseView {
    // MARK: - Outlets
    private let dateLabel = UILabel()
    private let iconView = UIImageView()
        .contentMode(.scaleToFill)
    private let tempLabel = UILabel()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    convenience init(content: Day) {
        self.init()
        _init()
        configure(with: content)
    }
}

// MARK: - Configuration
extension DayForecastView {
    public func configure(with content: Day) {
        dateLabel.text = content.date.toWeekday
        iconView.image = .init(named: "\(content.icon)")
        tempLabel.text = makeMinMaxTempText(content.minTemp, maxTemp: content.maxTemp)
    }
}

// MARK: - Private methods
extension DayForecastView {
    private func _init() {
        tempLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        let stack = UIStackView(arrangedSubviews: [
            dateLabel,
            iconView,
            tempLabel
        ])
            .axis(.horizontal)
            .spacing(8)
            .alignment(.center)
        
        addSubview(stack)
        stack.snp.makeConstraints { $0.edges.equalToSuperview() }

        iconView.snp.makeConstraints { $0.width.height.equalTo(20) }
    }
    
    private func makeMinMaxTempText(_ minTemp: Double, maxTemp: Double) -> String {
        let minTempString = "\(Int(minTemp))°"
        let maxTempString = "\(Int(maxTemp))°"
        return maxTempString + " / " + minTempString
    }
}

