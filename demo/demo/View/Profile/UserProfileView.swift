//
//  UserProfileView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/7/27.
//

import SwiftUI

struct UserProfileView: View {
    // 預設從.tweets
    @State var selectedFilter: TweetFilterOptions = .tweets
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
