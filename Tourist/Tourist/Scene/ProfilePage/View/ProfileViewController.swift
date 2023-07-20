//
//  ProfileViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPhone: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    @IBOutlet weak var ambulanceLabel: UILabel!
    @IBOutlet weak var policeLabel: UILabel!
    @IBOutlet weak var fireDepartmentLabel: UILabel!
    
    var viewModel = ProfileViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        viewModel.delegate = self
        viewModel.getUser()
        viewModel.getEmergencyCalls()
    }
    
    func configureUI(){
        self.title = "Profile"
    }
}

extension ProfileViewController: ProfileViewModelDelegate{
    func userDataFetched(userData: ProfileModel) {
        self.userName.text = userData.name
        self.userEmail.text = userData.email
        self.userPhone.text = userData.phoneNumber
    }
    
    
    func emergencyCallsFetched(emergencyCalls: EmergencyCalls) {
        self.ambulanceLabel.text = emergencyCalls.ambulance
        self.policeLabel.text = emergencyCalls.police
        self.fireDepartmentLabel.text = emergencyCalls.fireDepartment
    }
}
