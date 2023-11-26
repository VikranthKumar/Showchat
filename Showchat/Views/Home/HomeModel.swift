//
//  HomeModel.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import Foundation

struct HomeModel {
    private(set) var showchats: [Showchat]
    
    init(thumbnails: [String]) {
        // Note: setting thumbnails as friends since not a production app
        self.showchats = thumbnails.map { Showchat(thumnailImage: $0, friends: thumbnails) }
    }
    
    struct Showchat: Hashable {
        let thumnailImage: String
        let friends: [String]
    }
}
