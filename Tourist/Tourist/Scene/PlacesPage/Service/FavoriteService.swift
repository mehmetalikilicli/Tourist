//
//  FavoriteService.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 4.07.2023.
//

import UIKit
import CoreData

class FavoriteService {
    static let shared = FavoriteService()
    
    private init() {}
    
    func getFavoritePlaces(completion: @escaping ([String]) -> Void) {
        var favoritePlacesIdList = [String]()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let placeId = result.value(forKey: "place_id") as? String {
                        favoritePlacesIdList.append(placeId)
                    }
                }
            }
        } catch {
            print("Error fetching favorites")
        }
        
        completion(favoritePlacesIdList)
    }
    
    func addFavoritePlace(placeId: String, completion: @escaping (Bool) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Favorite", in: context)!
        let favorite = NSManagedObject(entity: entity, insertInto: context)
        favorite.setValue(placeId, forKey: "place_id")
        
        do {
            try context.save()
            completion(true)
        } catch {
            completion(false)
        }
    }
    
    func deleteFavoritePlace(placeId: String, completion: @escaping (Bool) -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Favorite")
        fetchRequest.predicate = NSPredicate(format: "place_id = %@", placeId)
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.delete(result)
                }
                
                try context.save()
                completion(true)
            } else {
                completion(false)
            }
        } catch {
            completion(false)
        }
    }
}
