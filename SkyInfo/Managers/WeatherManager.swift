//
//  WeatherManager.swift
//  SkyInfo
//
//  Created by Enes Sancar on 21.09.2023.
//

import Foundation
import WeatherKit
import CoreLocation

final class WeatherManager {
    static let shared = WeatherManager()
    
    private init () {}
    
    let service = WeatherService.shared
    
    // dışarıdan okunabilir fakat değiştirilemez
    public private(set) var currentWeather: CurrentWeather?
    public private(set) var hourlyWeather: [HourWeather] = []
    public private(set) var dailyWeather: [DayWeather] = []
    
    public func getWeather(for location: CLLocation, completion: @escaping() -> ()) {
        Task {
            do {
                let result = try await service.weather(for: location)
                self.currentWeather = result.currentWeather
                self.hourlyWeather = result.hourlyForecast.forecast
                self.dailyWeather  = result.dailyForecast.forecast
                completion()
                
            } catch {
                print(String(describing: error))
            }
        }
    }
}
