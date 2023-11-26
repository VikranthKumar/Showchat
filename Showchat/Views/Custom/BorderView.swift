//
//  BorderView.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import SwiftUI

struct BorderView: View {
    var body: some View {
        Rectangle()
            .fill(Color.border)
            .frame(height: 2)
    }
}
