//
//  PlaceDetailService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 20.06.2023.
//

import Foundation


class PlaceDetailService {
    
    static let shared = PlaceDetailService()
    
    var placeDetail : DetailFeature?
    
    func getPlaceDetail(placeId: String,completion: @escaping (DetailFeature?) -> Void) {

        let urlString = "\(PlaceDetailUrl.baseUrl)?id=\(placeId)\(PlaceDetailUrl.apiKey)"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil, let data = data else {
                completion(nil)
                print("error()\(error)")
                return
            }
            let answer = try? JSONDecoder().decode(PlaceDetail.self, from: data)
            print("answer\(answer)")
            //Api return features list. So use first index.
            answer == nil ? completion(nil) : completion(answer!.features?.first)
        }.resume()
    }

}
