//
//  FeedView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/22.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetView = false
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(0..<20) { _ in
                        TweetCell()
                    }
                }.padding()
            }
            
            Button(action: {
                isShowingNewTweetView.toggle()
            }, label: {
                Image("Tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetView) {
                NewTweetView(isPresented: $isShowingNewTweetView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
