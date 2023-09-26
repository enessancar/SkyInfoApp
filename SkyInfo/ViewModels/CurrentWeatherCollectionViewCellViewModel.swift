//
//  CurrentWeatherCollectionViewCellViewModel.swift
//  SkyInfo
//
//  Created by Enes Sancar on 24.09.2023.
//

import Foundation
import WeatherKit

struct CurrentWeatherCollectionViewCellViewModel {
    private let model: CurrentWeather
    
    init(model: CurrentWeather) {
        self.model = model
    }
    
    public var condition: String {
        return model.condition.description
    }
    
    public var temperature: String {
        return model.temperature.description
    }
    
    public var iconName: String {
        return model.symbolName
    }
}
