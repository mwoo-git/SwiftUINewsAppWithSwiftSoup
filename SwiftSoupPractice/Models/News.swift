//
//  News.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/04.
//

import Foundation

public class News: Codable, Identifiable {
    public var id: UUID
    var title: String
    var subTitle: String
    var author: String
    var imageUrl: String
    
    init(id: UUID = UUID(), imageUrl: String, title: String, subTitle: String, author: String) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.author = author
        self.imageUrl = imageUrl
    }

}

