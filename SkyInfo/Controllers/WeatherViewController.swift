//
//  WeatherViewController.swift
//  SkyInfo
//
//  Created by Enes Sancar on 21.09.2023.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {
    
    private let primaryView = CurrentWeatherView()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getLocation()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "crown"),
            style: .done, target: self,
            action: #selector(didTapUpgrade))
    }
    
    @objc private func didTapUpgrade() {
        
    }
    
    private func getLocation() {
        LocationManager.shared.getCurrentLocation { location in
            WeatherManager.shared.getWeather(for: location) { [weak self] in
                DispatchQueue.main.async {
                    guard let currentWeather = WeatherManager.shared.currentWeather else { return }
                    
                    self?.primaryView.configure(with: [
                        .current(viewModel: .init(model: currentWeather)),
                        .hourly(viewModels: WeatherManager.shared.hourlyWeather.compactMap({ .init(model: $0)})),
                        .daily(viewModels: WeatherManager.shared.dailyWeather.compactMap({.init(model: $0)}))
                    ])
                }
            }
        }
    }
    
    private func setupView() {
        view.addSubview(primaryView)
        primaryView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
