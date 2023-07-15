//
//  WeatherViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 4.07.2023.
//

import Foundation
import CoreLocation

protocol WeatherViewModelDelegate: AnyObject {
    func didUpdateWeather(_ weatherViewModel: WeatherViewModel, weather: WeatherModel)
    func didFailWithError(error: Error)
}

class WeatherViewModel: NSObject {
    weak var delegate: WeatherViewModelDelegate?
    var weatherManager = WeatherManager()
    
    override init() {
        super.init()
        weatherManager.delegate = self
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        weatherManager.fetchWeather(latitude: latitude, longitude: longitude)
    }
}

extension WeatherViewModel: WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        delegate?.didUpdateWeather(self, weather: weather)
    }
    
    func didFailWithError(error: Error) {
        delegate?.didFailWithError(error: error)
    }
}
