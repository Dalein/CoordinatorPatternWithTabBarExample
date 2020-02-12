//
//  SignInViewController.swift
//  Photos
//
//  Created by Bart Jacobs on 14/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, Storyboardable {
    
    @IBOutlet var usernameTextField: UITextField! {
        didSet {
            // Configure Username Text Field
            usernameTextField.placeholder = "Username"
            
            #if DEBUG
            usernameTextField.text = "bartjacobs"
            #endif
        }
    }
    
    @IBOutlet var passwordTextField: UITextField! {
        didSet {
            // Configure Password Text Field
            passwordTextField.placeholder = "Password"
            
            #if DEBUG
            passwordTextField.text = "123456789"
            #endif
        }
    }
    
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView! {
        didSet {
            activityIndicatorView.hidesWhenStopped = true
        }
    }
    
    var didSignIn: ((String) -> Void)?
    var didCancel: (() -> Void)?
    
    
    // MARK: - Actions
    
    @IBAction func signIn(_ sender: Any) {
        activityIndicatorView.startAnimating()
        
        signInButton.isHidden = true
        cancelButton.isEnabled = false
        
        DispatchQueue.global().async {
            sleep(1)
            
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                self.cancelButton.isEnabled = true
                
                // Invoke Handler
                self.didSignIn?("987654321")
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        didCancel?()
    }
    
}
