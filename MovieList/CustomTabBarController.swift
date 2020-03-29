//
//  CustomTabBarController.swift
//  MovieList
//
//  Created by Ainur on 3/28/20.
//  Copyright © 2020 Ainur. All rights reserved.
//


import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .red
        UINavigationBar.appearance().prefersLargeTitles = true
        let nav = generateNavController(vc: SearchViewController(), title: "Discover", image: #imageLiteral(resourceName: "loupe"))
        let nav2 = generateNavController(vc: ViewController(), title: "Watch List", image: #imageLiteral(resourceName: "heart"))
        let nav3 = generateNavController(vc: ViewController(), title: "Profile", image: #imageLiteral(resourceName: "user"))

        viewControllers = [nav, nav2, nav3]
    }
    
    func generateNavController(vc: UIViewController, title: String, image: UIImage) -> UINavigationController {
        vc.navigationItem.title = title
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem.image = image
        
        return navController
    }
}
