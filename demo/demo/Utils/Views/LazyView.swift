//
//  LazyView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/30.
//
//
// 延遲NavigationLink的載入, 當點擊時才載入 https://stackoverflow.com/questions/57594159/swiftui-navigationlink-loads-destination-view-immediately-without-clicking?answertab=active#tab-top



import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}

