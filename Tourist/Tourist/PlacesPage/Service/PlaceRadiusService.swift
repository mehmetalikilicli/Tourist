//
//  PlaceRadiusService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import Foundation
import Alamofire

class PlaceService {
    
    static let shared = PlaceService()
    
    var placeArray = [Feature]()
    
    func getPlaces() {
        
        AF.request("https://api.geoapify.com/v2/places?categories=healthcare.pharmacy&bias=proximity:28.97953000000000000,41.01513700000000&limit=20&apiKey=defd55eeef0b447d923ef01684d98e40",method: .get).response { response in
            
            if let data = response.data {
                do {
                    let answer = try JSONDecoder().decode(Place.self, from: data)
                    if let servicePlacesArray = answer.features {
                        self.placeArray = servicePlacesArray
                        print(servicePlacesArray)
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}
