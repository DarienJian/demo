//
//  Message.swift
//  demo
//
//  Created by Akira Akimoto on 2021/7/25.
//

import Foundation

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
