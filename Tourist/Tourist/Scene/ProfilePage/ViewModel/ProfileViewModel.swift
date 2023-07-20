//
//  ProfileViewModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 20.07.2023.
//

import Foundation
import Firebase

protocol ProfileViewModelDelegate: AnyObject {
    func userDataFetched(userData: ProfileModel)
    func emergencyCallsFetched(emergencyCalls: EmergencyCalls)
}

class ProfileViewModel {
    
    weak var delegate: ProfileViewModelDelegate?
    
    private var userData = ProfileModel()
    private var emergencyCalls = EmergencyCalls()
    
    func getUser(){
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("userData").addSnapshotListener { snapshot, error in
            if error != nil{
//                print(error?.localizedDescription)
//                Alert.makeAlert(viewController: self, title: "Hata!", message: "Kullanıcı bilgileri getirilemedi")
            }
            else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    if let document = snapshot?.documents[0]{
                        self.userData.name = document.get("userName") as? String
                        self.userData.phoneNumber = document.get("userPhoneNumber") as? String
                        self.userData.email = document.get("userEmail") as? String
                    }
                    self.delegate!.userDataFetched(userData: self.userData)
                } else {
                    print(error?.localizedDescription)
//                    Alert.makeAlert(viewController: self, title: "Hata", message: "Veritabanı verileri getirilemedi.")
                }
            }
        }
    }
    
    func getEmergencyCalls(){
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("emergencyCalls").addSnapshotListener { snapshot, error in
            if error != nil{
                print(error?.localizedDescription)
//                Alert.makeAlert(viewController: self, title: "Hata!", message: "Acil durum numaraları getirilemedi")
            }
            else{
                if snapshot?.isEmpty != true && snapshot != nil {
                    if let document = snapshot?.documents[0]{
                        self.emergencyCalls.ambulance = document.get("ambulance") as? String
                        self.emergencyCalls.police = document.get("police") as? String
                        self.emergencyCalls.fireDepartment = document.get("fireDepartment") as? String
                    }
                } else {
                    print(error?.localizedDescription)
//                    Alert.makeAlert(viewController: self, title: "Hata", message: "Veritabanı verileri getirilemedi.")
                }
                self.delegate?.emergencyCallsFetched(emergencyCalls: self.emergencyCalls)
            }
        }
    }
}
