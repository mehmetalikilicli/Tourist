//
//  PlaceService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 15.06.2023.
//

import Foundation

class PlaceService {
    
    static let shared = PlaceService()
    
    var placeArray = [Feature]()
    
    func getPlaces(placeName: String,completion: @escaping ([Feature]?) -> Void) {
        print(placeName)
        
        var placeCategory = placeControl(placeName: placeName)

        let urlString = "\(PlaceUrl.baseUrl)\(PlaceUrl.categories)\(placeCategory)\(PlaceUrl.bias)\(PlaceUrl.limit)\(PlaceUrl.apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                print(error)
                return
            }
            let answer = try? JSONDecoder().decode(Place.self, from: data)
            answer == nil ? completion(nil) : completion(answer!.features)
        }.resume()
    }
    
    func placeControl(placeName: String) -> String {
        switch placeName {
        case "Restaurant":
            return "catering.restaurant"
        case "Hotel":
            return "accommodation.hotel"
        case "Museum":
            return "entertainment.museum"
        case "Bus Station":
            return "public_transport.bus"
        case "Hospital":
            return "healthcare.hospital"
        case "Pharmacy":
            return "healthcare.pharmacy"
        case "Bank - ATM":
            return "service.financial.atm"
        case "Cafe":
            return "catering.cafe"
        case "Airport":
            return "airport.international"
        case "Train Station":
            return "public_transport.train"
        case "Rent A Car":
            return "rental.car"
        default:
            return "catering.restaurant"
        }
    }
}
