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
        .font(.plexSansSemiBold(size: 18))
    
    private lazy var stackView = UIStackView()
        .axis(.vertical)
        .spacing(10)
    
    private(set) lazy var tempLabel = UILabel()
        .font(.plexSansBold(size: 250))
        .textAlignment(.center)
        .adjustsFontSizeToFitWidth(true)
        .minimumScaleFactor(0.6)
        .textColor(.zeus)
    
    private(set) lazy var searchBar = UISearchBar()
        .placeholder(Texts.Forecast.searchPlaceholder)
        .font(.plexSansRegular(size: 17))
    
    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        view.contentMode(.scaleAspectFit)
        view.loopMode = .loop
        return view
    }()
    
    private(set) lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.color = .systemOrange
        let transform = CGAffineTransform(scaleX: 2, y: 2)
        indicator.transform = transform
        return indicator
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tempLabel.dropShadow()
    }
}

// MARK: - Configuration
extension ForecastView {
    public func configure(with content: Weather) {
        todayLabel.attributedText = makeAttributedText(from: content.city, date: content.date)
        tempLabel.text = "\(Int(content.temp))°"
        
        if let animation = LottieAnimation.named(content.animation),
           animation !== animationView.animation {
            animationView.pause()
            animationView.animation = animation
            animationView.play()
        }
        
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
        addSubviews(
            animationView,
            todayLabel,
            tempLabel,
            activityIndicator,
            stackView
        )
        
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
            make.horizontalEdges.equalToSuperview().inset(16)
        }
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
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
