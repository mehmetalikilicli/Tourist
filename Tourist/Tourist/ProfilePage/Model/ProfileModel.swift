//
//  ProfileModel.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 23.06.2023.
//

import Foundation

struct ProfileModel {
    var name: String?
    var image: String?
    var phoneNumber: String?
    var emergencyCalls: EmergencyCalls?
}


struct EmergencyCalls {
    
    var ambulance: String?
    var police: String?
    var fireDepartment: String?
}
