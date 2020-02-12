//
//  ProfileCoordinator.swift
//  Photos
//
//  Created by ivan.gnatyuk on 12/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    private let profileViewController = ProfileViewController.instantiate()
    
    
    // MARK: - API
    var rootViewController: UIViewController {
        return profileViewController
    }
    
    
    
}
