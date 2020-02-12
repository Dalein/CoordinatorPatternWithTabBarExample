//
//  ProfileViewController.swift
//  Photos
//
//  Created by ivan.gnatyuk on 12/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, Storyboardable {
    
    static var storyboardName: String {
        return "Profile"
    }
    
    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.text = title
        }
    }
    
    
    // MARK: - Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Set Title
        title = "Profile"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
