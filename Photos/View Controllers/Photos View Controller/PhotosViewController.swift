//
//  PhotosViewController.swift
//  Photos
//
//  Created by Bart Jacobs on 14/06/2019.
//  Copyright © 2019 Code Foundry. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, Storyboardable {
    
    @IBOutlet var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var viewModel: PhotosViewModel!
    
    var didSignIn: (() -> Void)?
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Photos"
        
        // Setup View
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Update View
        updateView()
    }
    
    // MARK: - View Methods
    
    private func setupView() {
        updateView()
    }
    
    private func updateView() {
        if UserDefaults.isSignedIn {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut(_:)))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(signIn(_:)))
        }
        
        if let indexPaths = tableView.indexPathsForVisibleRows {
            // Update Table View
            tableView.reloadRows(at: indexPaths, with: .none)
        }
    }
    
    // MARK: - Actions
    
    @objc func signOut(_ sender: UIBarButtonItem) {
        // Update User Defaults
        UserDefaults.token = nil
        
        // Update View
        updateView()
    }
    
    @objc func signIn(_ sender: UIBarButtonItem) {
        didSignIn?()
    }
    
}

extension PhotosViewController: UITableViewDataSource {
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as? PhotoTableViewCell else {
            fatalError("Unable to Dequeue Photo Table View Cell")
        }
        
        let viewModel = self.viewModel.photoViewModelForPhoto(at: indexPath.row)
        cell.configure(with: viewModel)
        
        cell.didBuy = { [weak self] in
            self?.viewModel.buyPhoto(at: indexPath.row)
        }
        
        return cell
    }
    
}

extension PhotosViewController: UITableViewDelegate {
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.selectPhoto(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
}
