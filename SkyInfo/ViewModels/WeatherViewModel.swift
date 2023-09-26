//
//  WeatherViewModel.swift
//  SkyInfo
//
//  Created by Enes Sancar on 24.09.2023.
//

import Foundation

enum WeatherViewModel {
    case current(viewModel: CurrentWeatherCollectionViewCellViewModel)
    case hourly(viewModels: [HourlyWeatherCollectionViewCellViewModel])
    case daily(viewModels : [DailyWeatherCollectionViewCellViewModel])
}
