//
//  ContentView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/22.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    // EnvironmentObject 可以在任何需要的地方共享模型數據, 確保數據更新時自動保持更新
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedIndex = 0
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NavigationView {
                    MainTabView(selectedIndex: $selectedIndex)
                        .navigationBarTitle(viewModel.tabTitle(forIndex: selectedIndex))
                        .navigationBarItems(leading: Button(action: {
                            viewModel.signOut()
                        }, label: {
                            if let user = viewModel.user {
                                KFImage(URL(string: user.profileImageUrl))
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: 32, height: 32)
                                    .cornerRadius(16)
                                
                            }
                            
                        }))
                        .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
