//
//  Image++.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import SwiftUI

extension Image {
    func icon() -> some View {
        resizable()
            .scaledToFit()
            .frame(width: 22, height: 22)
    }
}
