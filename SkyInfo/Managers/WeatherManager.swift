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
    
    public func getWeather(for location: CLLocation, completion: @escaping() -> ()) {
        Task {
            do {
                let result = try await service.weather(for: location)
                print(result.currentWeather)
                
            } catch {
                print(String(describing: error))
            }
        }
    }
}
