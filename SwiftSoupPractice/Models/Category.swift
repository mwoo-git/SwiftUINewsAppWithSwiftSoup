//
//  Categories.swift
//  SwiftSoupPractice
//
//  Created by Woo Min on 2022/09/07.
//

import Foundation

enum Category: String, CaseIterable {
    
    case tech
    case science
    case business
    case yourmoney
    case education
    case sports
    case space
    
    var title: String {
        switch self {
        case .tech: return "Tech"
        case .science: return "Science"
        case .business: return "Business"
        case .yourmoney: return "Your Money"
        case .education: return "Education"
        case .sports: return "Sports"
        case .space: return "Space"
        }
    }
    
    var url: String {
        switch self {
        case .science : return "https://www.nytimes.com/section/science"
        case .tech: return "https://www.nytimes.com/section/technology"
        case .business: return "https://www.nytimes.com/section/business/smallbusiness"
        case .yourmoney: return "https://www.nytimes.com/section/your-money"
        case .education: return "https://www.nytimes.com/section/education?module=SiteIndex&pgtype=Section%20Front&region=Footer"
        case .sports: return "https://www.nytimes.com/section/sports/soccer"
        case .space: return "https://www.nytimes.com/section/science/space"
        }
    }
}
