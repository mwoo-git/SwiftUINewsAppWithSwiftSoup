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
    
    var cancellableTask: AnyCancellable? = nil
    
    var htmlScrapUtlity = HTMLScraperUtility()
    
    init() {
        loadNews()
    }
    
    func loadNews() {
        let urlString = "https://www.nytimes.com/section/science"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.setValue("Mozilla/5.0 (Windows NT 10.0; Win64; x64) Chrome/100.0.48496.75", forHTTPHeaderField: "User-Agent")
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

