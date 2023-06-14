//
//  Urls.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import Foundation

//https://api.geoapify.com/v2/places?categories=healthcare.pharmacy&bias=proximity:28.97953000000000000,41.01513700000000&limit=20&apiKey=defd55eeef0b447d923ef01684d98e40

struct PlaceUrl {
    static let baseUrl = "https://api.geoapify.com/v2/places"
    static let categories = "?categories=healthcare.pharmacy"
    static let bias = "&bias=proximity:28.97953000000000000,41.01513700000000"
    static let limit = "&limit=20"
    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
}


//struct PlaceUrl {
//https://api.geoapify.com/v2/places?categories=public_transport.subway&filter=circle:28.97953000000000000,41.01513700000000,3000&bias=proximity:28.97953000000000000,41.01513700000000&limit=20&apiKey=defd55eeef0b447d923ef01684d98e40
//    static let baseUrl = "https://api.geoapify.com/v2/places"
//    static let categories = "?categories=public_transport.subway"
//    static let filter = "&filter=circle:28.97953000000000000,41.01513700000000,3000"
//    static let bias = "&bias=proximity:28.97953000000000000,41.01513700000000"
//    static let limit = "&limit=20"
//    static let apiKey = "&apiKey=defd55eeef0b447d923ef01684d98e40"
//}
