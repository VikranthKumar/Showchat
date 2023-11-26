//
//  ShowchatView.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/26/23.
//

import SwiftUI

struct ShowchatView: View {
    let showchat: HomeModel.Showchat
    
    init(_ showchat: HomeModel.Showchat) {
        self.showchat = showchat
    }
    
    var body: some View {
        Image(showchat.thumnailImage)
            .resizable()
            .scaledToFit()
            .cornerRadius(Constants.cardRadius)
            .overlay(friends, alignment: .bottomTrailing)
            .padding(.bottom, Constants.friendsSize / 2)
    }
    
    private var friends: some View {
        HStack(spacing: Constants.friendsOffset) {
            ForEach(0..<min(Constants.maxFriendsCount, showchat.friends.count), id: \.self) { index in
                Image(showchat.friends[index])
                    .resizable()
                    .scaledToFill()
                    .frame(width: Constants.friendsSize, height: Constants.friendsSize)
                    .if(index == (Constants.maxFriendsCount - 1) && showchat.friends.count > Constants.maxFriendsCount) { view in
                        view
                            .overlay(
                                Text("+\(showchat.friends.count - Constants.maxFriendsCount)")
                                    .font(.regular)
                                    .foregroundColor(.text)
                                    .fullFrame()
                                    .background(Color.transparent)
                            )
                    }
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.text, lineWidth: Constants.borderWidth))
            }
        }
        .offset(CGSize(width: 0, height: 23))
    }
    
    private struct Constants {
        static let maxFriendsCount: Int = 4
        static let friendsSize: CGFloat = 46
        static let friendsOffset: CGFloat = -16
        static let cardRadius: CGFloat = 24
        static let borderWidth: CGFloat = 1.5
    }
}
