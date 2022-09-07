//
//  NewsRowView.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import SwiftUI
import Kingfisher

struct NewsRowView: View {
    let news: News
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(news.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(news.subTitle)
                    .font(.subheadline)
                    .opacity(0.7)
                    .lineLimit(2)
                
                Text(news.author)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            KFImage(URL(string: news.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 120)
                .clipped()
                .cornerRadius(10)
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        
        Divider()
            .padding(.horizontal)
    }
}

//struct NewsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRowView()
//    }
//}
