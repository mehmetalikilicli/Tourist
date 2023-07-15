//
//  MainTabberViewController.swift
//  Tourist
//
//  Created by Mehmet Ali Kılıçlı on 13.06.2023.
//

import UIKit

class MainTabberViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        let vc1 = UINavigationController(rootViewController: PlacesCategoryViewController())
        let vc2 = UINavigationController(rootViewController: WeatherViewController())
        let vc3 = UINavigationController(rootViewController: FavoriteViewController())
        let vc4 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "sun.min.fill")
        vc3.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc4.tabBarItem.image = UIImage(systemName: "person.fill")
        
        vc1.title = "Places"
        vc2.title = "Weather"
        vc3.title = "Favorite"
        vc4.title = "Profile"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3, vc4], animated: true)
        
        
    }
}
