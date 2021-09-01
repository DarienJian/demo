//
//  User.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/21.
//

import Firebase

struct User: Identifiable {
    let id: String
    let username: String
    let profileImageUrl: String
    let fullname: String
    let email: String
    var stats: UserStats
    var isCurrentUser: Bool { Auth.auth().currentUser?.uid == self.id }
    var isFollowed = false
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.stats = UserStats(followers: 0, following: 0)
    }
}


struct UserStats {
    let followers: Int
    let following: Int
}
