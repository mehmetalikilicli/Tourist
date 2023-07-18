//
//  Alert.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 18.07.2023.
//

import Foundation
import UIKit


struct Alert {
    static func makeAlert(viewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        viewController.present(alert, animated: true, completion: nil)
    }
}
