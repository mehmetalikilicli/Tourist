//
//  PlaceService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 15.06.2023.
//

import Foundation

class PlaceService {
    
    static let shared = PlaceService()
    
    func getPlaces(placeName: String, completion: @escaping ([Feature]?) -> Void) {
        
        var placeCategory = placeControl(placeName: placeName)

        let urlString = "\(PlaceUrl.baseUrl)\(PlaceUrl.categories)\(placeCategory)\(PlaceUrl.bias)\(PlaceUrl.limit)\(PlaceUrl.apiKey)"
        
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
        case "Outdoor And Sport":
            return "commercial.outdoor_and_sport"
        case "Camping Site":
            return "camping.camp_site"
        case "Cinema":
            return "entertainment.cinema"
        case "Zoo":
            return "entertainment.zoo"
        case "Theatre":
            return "entertainment.culture.theatre"
        case "Shopping Mall":
            return "commercial.shopping_mall"
        case "Supermarket":
            return "commercial.supermarket"
        default:
            return "catering.restaurant"
        }
    }
}
