//
//  ChatView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/30.
//

import SwiftUI

struct ChatView: View {
    @State var messageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 12){
                    ForEach(0..<15) { _ in
                        HStack {
                            Spacer()
                            Text("Teset message text")
                                .padding()
                                .background(Color.blue)
                                .clipShape(ChatBubble(isFromCurrentUser: true))
                                .padding(.horizontal)
                        }
                    }
                }
            }
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
