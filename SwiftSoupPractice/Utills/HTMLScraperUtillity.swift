//
//  HTMLScraperUtillity.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import Foundation
import SwiftSoup
import Combine

class HTMLScraperUtility {
    
    func scrapNews(from data:Data) -> Future<[News], Never> {
        Future { promise in
            let html = String(data: data, encoding: .utf8)!
            var news = [News]()
            do {
                let elements = try SwiftSoup.parse(html)
                let documents = try elements.getElementById("stream-panel")?.select("div.css-13mho3u").select("ol").select("div").select("div").select("a")
                documents?.forEach({ (document) in
                    let imageUrl = try? document.select("div").select("figure").select("div").select("img").attr("src")
                    let title = try? document.select("h2").text()
                    let subtitle = try? document.select("p").text()
                    let author = try? document.select("div").select("p").select("span").text()
                    if let title = title,
                       let subtitle = subtitle,
                       let author = author,
                       let imageUrl = imageUrl,
                       !title.isEmpty,
                       !subtitle.isEmpty,
                       !author.isEmpty,
                       !imageUrl.isEmpty {
                        
                        let newsData = News(imageUrl: imageUrl, title: title, subTitle: subtitle, author: author)
                        news.append(newsData)
                    }
                })
                promise(.success(news))
            } catch let error {
                debugPrint(error)
                promise(.success([]))
                return
            }
        }
    }
    
}
