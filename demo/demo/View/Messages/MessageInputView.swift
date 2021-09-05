//
//  MessageInputView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/30.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var action: () -> Void
    
    var body: some View {
        HStack {
            TextField("Message...", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(minHeight: 30)
            
            Button(action: action, label: {
                Text("Send")
                    .bold()
                    .foregroundColor(.blue)
            })
        }
    }
}

