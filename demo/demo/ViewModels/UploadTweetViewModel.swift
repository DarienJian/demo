//
//  UploadTweetViewModel.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/26.
//

import SwiftUI
import Firebase

class UploadTweetViewModel: ObservableObject {
    @Binding var isPresented: Bool
    
    init (isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    func uploadTweet(caption: String) {
        guard let user = AuthViewModel.shared.user else {return}
        let docRef = COLLECTION_TWEETS.document()
        
        let data: [String: Any] = [
            "uid": user.id,
            "caption": caption,
            "fullname": user.fullname,
            "username": user.username,
            "timestamp": Timestamp(date: Date()),
            "profileImageUrl": user.profileImageUrl,
            "likes": 0,
            "id": docRef.documentID
        ]
        
        docRef.setData(data) { _ in
            self.isPresented = false
        }
    }
}
