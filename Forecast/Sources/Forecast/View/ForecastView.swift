//
//  ForecastView.swift
//  Zeus
//
//  Created by Paul Matar on 27/08/2023.
//

import UIKit
import Design
import Lottie

final class ForecastView: BaseView {
    // MARK: - Outlets
    private lazy var todayLabel = UILabel()
        .numberOfLines(2)
        .textAlignment(.center)
    
    private lazy var stackView = UIStackView()
        .axis(.vertical)
        .spacing(10)
    
    private(set) lazy var tempLabel = UILabel()
        .font(.monospacedSystemFont(ofSize: 250, weight: .bold))
        .textColor(.zeus)
    
    private(set) lazy var searchBar = UISearchBar()
        .placeholder(Texts.Forecast.searchPlaceholder)
    
    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.contentMode(.scaleAspectFit)
        view.loopMode = .loop
        return view
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
}

// MARK: - Configuration
extension ForecastView {
    public func configure(with content: Weather) {
        animationView.pause()
        animationView.animation = .named(content.animation)
        animationView.play()
        todayLabel.attributedText = makeAttributedText(from: content.city, date: content.date)
        tempLabel.text = "\(Int(content.temp))"
        
        stackView.arrangedSubviews.forEach { subview in
            stackView.removeArrangedSubview(subview)
            subview.removeFromSuperview()
        }
        content.forecast.forEach { content in
            stackView.addArrangedSubview(DayForecastView(content: content))
        }
    }
}

// MARK: - Private methods
extension ForecastView {
    private func _init() {
        tempLabel.dropShadow()

        addSubviews(animationView, todayLabel, tempLabel)
        
        animationView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(375)
            make.width.equalToSuperview()
        }
        
        todayLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide)
                .inset(30)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.greaterThanOrEqualTo(tempLabel.snp.bottom).inset(30)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(30)
        }
    }
    
    private func makeAttributedText(from city: String, date: Date) -> NSMutableAttributedString {
        let cityAttrString = NSAttributedString(string: city.uppercased(),
                                                attributes: [.foregroundColor: UIColor.berlin])
        let finalString = NSMutableAttributedString(attributedString: cityAttrString)
        
        let dateAttrString = NSAttributedString(string: "\n\(date.toWeekdayAndTime)",
                                                attributes: [.foregroundColor: UIColor.monday])
        finalString.append(dateAttrString)
        return finalString
    }
}