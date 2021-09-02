//
//  SearchViewModel.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/22.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init () {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            // 迴圈處理資料兩種寫法
            self.users = documents.map({ User(dictionary: $0.data()) })
//            documents.forEach { document in
//                let user = User(dictionary: document.data())
//                self.users.append(user)
//            }
            
        }
    }
    
    func filteredUsers(_ query: String) -> [User] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.fullname.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
}
