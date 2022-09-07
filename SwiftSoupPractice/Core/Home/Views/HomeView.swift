//
//  HomeView.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var selectedOption: Category = .tech
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Button {
                    
                } label: {
                    Image(systemName: "person")
                        .font(.title2)
                }
                
                Spacer()
                
                Text("NEWS")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
            // NewsOptionList
            NewsOptionListView(selectedOption: $selectedOption)
                .padding([.top, .horizontal])
                .overlay(
                    Divider()
                        .padding(.horizontal, -16)
                    , alignment: .bottom
                )
            // AllNews
            ScrollView(.vertical, showsIndicators: false) {
                AllNewsView(viewModel: viewModel)
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
