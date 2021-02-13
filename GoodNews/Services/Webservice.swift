//
//  Webservice.swift
//  GoodNews
//
//  Created by DJ on 2/12/21.
//

import Foundation

class Webservice {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                if let articleList = try? JSONDecoder().decode(ArticleList.self, from: data) {
                    print(articleList.articles)
                    completion(articleList.articles)
                }
            }
        }.resume()
        
    }
}
