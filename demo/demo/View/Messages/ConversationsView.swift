//
//  ConversationsView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/26.
//

import SwiftUI

struct ConversationsView: View {
    @State var isShowingNewMessageView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            ScrollView{
                VStack{
                    ForEach(0..<20) { _ in
                        NavigationLink(
                            destination: Text("Chat View"),
                            label: {
                                ConversationCell()
                            })
                    }
                }.padding()
            }
            
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding()
            })
            .background(Color(.systemBlue))
            .foregroundColor(Color(.white))
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                SearchView()
            })
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
