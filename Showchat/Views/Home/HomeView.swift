//
//  HomeView.swift
//  Showchat
//
//  Created by Vikranth Kumar on 11/25/23.
//

import SwiftUI

struct HomeView: View {
    
    var viewModel: HomeViewModel
    
    @State var searchText: String = .empty
    
    var body: some View {
        VStack(spacing: 0) {
            searchView
            commentView
            showchatsView
            Spacer()
        }
        .fullFrame()
        .background(Color.background)
        .ignoresSafeArea(.keyboard)
        
    }
    
    private var searchView: some View {
        VStack(spacing: 0) {
            BorderView()
            HStack {
                Image(.searchImage)
                    .icon()
                // Note: Not implemented search since it's not in the scope of the assignment
                TextField(String.empty, text: $searchText, prompt: Text(String.searchPlaceholder).foregroundColor(.textSecondary))
                    .font(.regular)
                    .foregroundColor(.text)
                // Note: This will be a button that resets search text and results
                Image(.cross)
                    .icon()
            }
            .padding()
            .background(Color.backgroundSecondary)
            BorderView()
        }
    }
    
    private var commentView: some View {
        HStack {
            Text(String.searchComment)
                .font(.regularLight)
                .lineSpacing(Constants.Comment.textSpacing)
                .padding()
                .padding(.top, Constants.Comment.textTopPadding)
            Spacer()
        }
        .background(CommentShape().fill(LinearGradient(gradient: Gradient(colors: [.gradientStart, .gradientEnd]), startPoint: .topTrailing, endPoint: .bottomLeading)))
        .offset(CGSize(width: 0, height: Constants.Comment.offset))
        .padding(.horizontal)
    }
    
    private var showchatsView: some View {
        VStack(alignment: .leading) {
            Text(String.popularShowchats)
                .font(.largeMedium)
                .foregroundColor(.text)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: Constants.Showchats.cardSpacing) {
                    ForEach(viewModel.showchats, id: \.self) { showchat in
                        ShowchatView(showchat)
                    }
                }
                .padding([.horizontal, .bottom])
            }
        }
    }
    
    private struct Constants {
        struct Comment {
            static let textSpacing: CGFloat = 5
            static let textTopPadding: CGFloat = CommentShape.pointerHeight * 1.732
            static let offset: CGFloat = -CommentShape.pointerHeight / 2
        }
        struct Showchats {
            static let cardSpacing: CGFloat = 16
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
