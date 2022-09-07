//
//  AllNewsView.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import SwiftUI

struct AllNewsView: View {
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.news) { new in
                    NewsRowView(news: new)
                }
            }
        }
    }
}

//struct AllNewsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllNewsView()
//    }
//}
