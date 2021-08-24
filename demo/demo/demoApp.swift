//
//  demoApp.swift
//  demo
//
//  Created by Akira Akimoto on 2021/5/22.
//

import SwiftUI
import Firebase

@main
struct demoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
