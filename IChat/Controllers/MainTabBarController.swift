//
//  MainTabBarController.swift
//  IChat
//
//  Created by Ramil Davletshin on 22.12.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = #colorLiteral(red: 0.5568627451, green: 0.3529411765, blue: 0.968627451, alpha: 1)
        
        
        let listVC = ListViewController()
        let peopleVC = PeopleViewController()
        let boldConfig = UIImage.SymbolConfiguration(weight: .medium)
        let convImage = UIImage(systemName: "bubble.left.and.bubble.right", withConfiguration: boldConfig)
        let peopleImage = UIImage(systemName: "person.2", withConfiguration: boldConfig)
        
        viewControllers = [generateNavigationController(rootViewController: listVC, tittle: "Conversations", image: convImage),
                           generateNavigationController(rootViewController: peopleVC, tittle: "People", image: peopleImage)]
        
    }
    
    
    private func generateNavigationController(rootViewController: UIViewController, tittle: String, image: UIImage?) -> UIViewController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        return navigationVC
    }
}
