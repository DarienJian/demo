//
//  LazyView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/8/30.
//

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

