//
//  Urls.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import Foundation


struct PlaceUrl {
    static let baseUrl = "https://api.geoapify.com/v2/places"
    static let categories = "?categories="
    static let bias = "&bias=proximity:35.48637300000000000,38.71966600000000"
    static let limit = "&limit=100"
    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
}


struct PlaceDetailUrl {
    static let baseUrl = "https://api.geoapify.com/v2/place-details"
    static let baseId = "?id="
    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
}

struct WeatherUrl {
    static let baseUrl = "https://api.openweathermap.org/data/2.5/weather?appid=3dfd290ff795718f7c37e4bf2a4bd654&units=metric"
    
}
