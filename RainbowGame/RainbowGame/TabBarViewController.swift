////
////  TapBarViewController.swift
////  RainbowGame
////
////  Created by Dmitrii Dorogov on 13.11.2023.
////
//
//import Foundation
//
//import UIKit
//
//class TabBarViewController: UITabBarController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        let vc1 = RulesViewController()
//        
//        vc1.title = "Help"
//        
//        vc1.navigationItem.largeTitleDisplayMode = .always
//        
//        let nav1 = UINavigationController(rootViewController: vc1)
//        
//        nav1.navigationBar.tintColor = .label
//        
//        nav1.tabBarItem = UITabBarItem(title: "help", image: UIImage(systemName: "questionmark"), tag: 1)
//        
//        nav1.navigationBar.prefersLargeTitles = true
//        
//        setViewControllers([nav1], animated: false)
//
//    }
//
//}
