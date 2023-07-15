//
//  WeatherManager.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 21.06.2023.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(WeatherUrl.baseUrl)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let humidity = decodedData.main.humidity
            let name = decodedData.name
            let desc = decodedData.weather[0].description.capitalized
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, humidity: humidity, description: desc)
            return weather
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}


