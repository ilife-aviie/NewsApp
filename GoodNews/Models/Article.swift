//
//  Article.swift
//  GoodNews
//
//  Created by DJ on 2/12/21.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
