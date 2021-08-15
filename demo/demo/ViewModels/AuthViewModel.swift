//
//  AuthViewModel.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/11.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    // 當這個 Published 被更新時，會發送一個事件通知給監控它的物件
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func login(email:String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUD: Failed to login: \(error.localizedDescription)")
                return
            }
            
            print("成功登入")
        }
    }
    
    
    func registerUser (email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        
        guard let imageDate = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        
        storageRef.putData(imageDate, metadata: nil) { _, error in
            if let error = error {
                print("DEBUD: Failed to upload image \(error.localizedDescription)")
                return
            }
            
            print("成功上傳圖片")
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG error \(error.localizedDescription)")
                        return
                    }
                    print("成功建立使用者")
                    
                    guard let user = result?.user else { return }
                    
                    let data = [
                        "email": email,
                        "username": username,
                        "fullname": fullname,
                        "profileImageUrl": profileImageUrl,
                        "uid": user.uid
                    ]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("DEBUG: 成功上傳資料")
                    }
                }
            }
        }
    }
    
    func signOut() {
        userSession = nil
        try?Auth.auth().signOut()
    }
}


