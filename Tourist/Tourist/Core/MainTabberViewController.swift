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
        
        let vc1 = UINavigationController(rootViewController: PlacesViewController())
        let vc2 = UINavigationController(rootViewController: WeatherViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc2.tabBarItem.image = UIImage(systemName: "play.circle")
        vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        vc1.title = "Places"
        vc2.title = "Weather"
        vc3.title = "Profile"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
        
    }
}
