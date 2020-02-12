//
//  PhotoViewModel.swift
//  Photos
//
//  Created by ivan.gnatyuk on 12/02/2020.
//  Copyright © 2020 Code Foundry. All rights reserved.
//

import Foundation

struct PhotoViewModel {
    let photo: Photo
    
    var title: String {
        return photo.title
    }
    
    var url: URL? {
        return photo.url
    }
    
    var didBuyPhoto: Bool {
        return UserDefaults.didBuy(photo)
    }
}
