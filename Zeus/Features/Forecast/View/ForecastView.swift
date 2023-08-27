//
//  ForecastView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit

final class ForecastView: BaseView {
    // MARK: - Outlets
    private(set) lazy var todayLabel = UILabel()
        .numberOfLines(2)
        .textAlignment(.center)
        .text("BERLIN\nMON, 11AM")
    
    private(set) lazy var tempLabel = UILabel()
        .font(.monospacedSystemFont(ofSize: 220, weight: .bold))
        .text("27")

    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
}

// MARK: - Private methods
extension ForecastView {
    private func _init() {
        addSubviews(todayLabel, tempLabel)
        
        todayLabel.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 50))
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide)
                .inset(30)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

    }
}
