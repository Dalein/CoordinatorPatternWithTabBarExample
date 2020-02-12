//
//  AppCoordinator.swift
//  Photos
//
//  Created by ivan.gnatyuk on 12/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    private let tabBarController = UITabBarController()
    
    
    // MARK: - API
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    override func start() {
        childCoordinators.forEach { (childCoordinator) in
            childCoordinator.start()
        }
    }
    
    
    // MARK: - Init
    
    override init() {
        super.init()
        
        let photosCoordinator = PhotosCoordinator()
        let profileCoordinator = ProfileCoordinator()
        
        tabBarController.viewControllers = [
            photosCoordinator.rootViewController,
            profileCoordinator.rootViewController
        ]
        
        childCoordinators.append(photosCoordinator)
        childCoordinators.append(profileCoordinator)
    }
    
}
