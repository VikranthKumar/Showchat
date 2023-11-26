//
//  HomeViewModel.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import Foundation

@Observable class HomeViewModel {
    // Note: using string literals for the time being
    private static let thumbnails = ["all-the-light-we-cannot-see","beef","indian_matchmaking","love-is-blind","love-island-2019","queer-eye","selling-sunset","suits","the-circle","the-great-british-bake-off"]
    
    private let model: HomeModel = HomeModel(thumbnails: thumbnails)
        
    var showchats: [HomeModel.Showchat] {
        model.showchats
    }
}
