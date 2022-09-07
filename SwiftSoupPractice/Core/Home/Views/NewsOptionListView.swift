//
//  NewsOptionListView.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/07.
//

import SwiftUI

struct NewsOptionListView: View {
    @StateObject var viewModel: HomeViewModel
    @Binding var selectedOption: Category
    @Namespace var animation
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(Category.allCases, id: \.self) { item in
                        VStack {
                            Text(item.title)
                                .foregroundColor(item == selectedOption ? .black : .gray)
                            // 움직이는 바
                            
                            if selectedOption == item {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "item", in: animation)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            } else {
                                Capsule()
                                    .fill(.clear)
                                    .frame(height: 3)
                                    .padding(.horizontal, -10)
                            }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.selectedOption = item
                                proxy.scrollTo(selectedOption, anchor: .center)
                            }
                            viewModel.loadNews(for: item) // 카테고리를 선택하면 화면 로드
                        }
                    }
                }
            }
        }
    }
}

//struct NewsOptionListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsOptionListView()
//    }
//}
