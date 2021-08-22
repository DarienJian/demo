//
//  UserProfileView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/7/27.
//

import SwiftUI

struct UserProfileView: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    init (user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    // 預設從.tweets
    @State var selectedFilter: TweetFilterOptions = .tweets
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView(isFollowed: $viewModel.isFollowed, viewModel: viewModel)
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}
