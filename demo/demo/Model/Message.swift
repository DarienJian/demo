//
//  Message.swift
//  demo
//
//  Created by Akira Akimoto on 2021/7/25.
//
import Firebase


struct Message: Identifiable {
    let text: String
    let user: User
    let toId: String
    let fromId: String
    let isFromCurrentUser: Bool
    let timestamp: Timestamp
    let id: String

    var chatPartnerId: String { return isFromCurrentUser ? toId : fromId }
    
    init(user: User, dictionary: [String: Any]) {
        self.user = user
        
        self.text = dictionary["text"] as? String ?? ""
        self.toId = dictionary["toId"] as? String ?? ""
        self.fromId = dictionary["fromId"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
        self.id = dictionary["id"] as? String ?? ""
    }
    
}

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}

let MOCK_MESSAGES: [MockMessage] = [
    .init(id: 0, imageName: "spiderman", messageText: "Hello", isCurrentUser: false),
    .init(id: 1, imageName: "batman", messageText: "not much, you?", isCurrentUser: true),
    .init(id: 2, imageName: "batman", messageText: "今晚吃什麼", isCurrentUser: true),
    .init(id: 3, imageName: "batman", messageText: "吃飯?", isCurrentUser: true),
    .init(id: 4, imageName: "spiderman", messageText: "不是", isCurrentUser: false),
    .init(id: 5, imageName: "spiderman", messageText: "我吃麵", isCurrentUser: false),
    .init(id: 6, imageName: "batman", messageText: "OK", isCurrentUser: true),
    .init(id: 7, imageName: "spiderman", messageText: "你呢", isCurrentUser: false)
]
