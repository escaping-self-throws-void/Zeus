//
//  DailyForecastView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

final class DailyForecastView: BaseView {
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
}

// MARK: - Configuration
extension DailyForecastView {
    struct Configuration {
        let date: String
        let icon: UIImage?
        let temp: String
    }
    public func configure(with config: Configuration) {
        dateLabel.text = config.date
        iconView.image = config.icon
        tempLabel.text = config.temp
    }
}

// MARK: - Private methods
extension DailyForecastView {
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
}

