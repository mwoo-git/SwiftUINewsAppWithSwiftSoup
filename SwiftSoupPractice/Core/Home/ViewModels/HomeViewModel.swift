//
//  HomeViewModel.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var news = [News]()
    //    @Published var isNewsLoading = false
    @Published var selectedCategory: Category = Category.tech
    
    var cancellableTask: AnyCancellable? = nil
    
    var htmlScrapUtlity = HTMLScraperUtility()
    
    init() {
        loadNews(for: selectedCategory)
    }
    
    func loadNews(for category: Category) {
        guard let url = URL(string: category.url) else { return }
        var request = URLRequest(url: url)
        request.addValue("Mozilla/5.0", forHTTPHeaderField: "User-Agent")
        //        self.isNewsLoading = true
        self.cancellableTask?.cancel()
        self.cancellableTask = URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
//            .handleEvents(receiveOutput: { data in
//                print("Data is \(data)")
//            })
            .flatMap(htmlScrapUtlity.scrapNews(from:))
            .receive(on: DispatchQueue.main) // 필요한가?
            .sink { (completion) in
                //                self.isNewsLoading = false //once we got articles, close the loader
            } receiveValue: { [unowned self] (news) in
                self.news = news
                //                print(news)
            }
    }
    
    deinit {
        cancellableTask = nil
    }
}

