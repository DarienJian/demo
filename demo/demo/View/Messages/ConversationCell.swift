//
//  ConversationCell.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/26.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
            HStack(spacing: 12) {
                Image("venom-10")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(28)
                
                VStack (alignment: .leading, spacing: 4){
                    Text("venom")
                        .font(.system(size: 14, weight: .semibold))
                    
                    Text("messages message messages messages messages messages")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }
                .foregroundColor(.black)
                .padding(.trailing)
            }
            
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
