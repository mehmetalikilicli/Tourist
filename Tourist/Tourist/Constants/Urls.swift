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
    static let limit = "&limit=20"
    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
}

//https://api.geoapify.com/v2/place-details?id=5149e30632f1f93c4059d967e54dd9814440f00103f90153878230010000009203145369726b656369204761722045637a616e657369&apiKey=defd55eeef0b447d923ef01684d98e40

struct PlaceDetailUrl {
    static let baseUrl = "https://api.geoapify.com/v2/place-details"
    static let baseId = "?id="
    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
}
