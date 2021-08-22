//
//  UserCell.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/26.
//

import SwiftUI
import KingfisherSwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 56, height: 56)
                .cornerRadius(28)
            
            VStack (alignment: .leading, spacing: 4){
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
                
            }
            .foregroundColor(.black)
        }
    }
}
