//
//  FilterButtonView.swift
//  demo
//
//  Created by Akira Akimoto on 2021/7/27.
//

import SwiftUI

// protocol CaseIterable 是將枚舉可以以陣列方式使用
enum TweetFilterOptions: Int , CaseIterable {
    case tweets
//    case replies
    case likes
    
    var title: String {
        // 接 self 可讀取自身case
        switch self {
        case .tweets:
            return "Tweets"
//        case .replies:
//            return "Tweets & Replies"
        case .likes:
            return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TweetFilterOptions
    
    // 依據case 數量去分配寬度要幾等分
    private let underlineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        let rawValue = CGFloat(selectedOption.rawValue) // 目前枚舉第幾個
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return (UIScreen.main.bounds.width / count) * rawValue + 16
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) { option
                    in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                    })
                }
            }
            
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding) // 給予左側間距, 因為按鈕使padding變化
                .animation(.spring()) // 動畫化
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
