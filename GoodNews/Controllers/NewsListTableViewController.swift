//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by DJ on 2/12/21.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    private var articleListVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=f7cc7c39c6774c17a570c65e2571fa5b")!
        
        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM?.numberOfSections ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath)  as? ArticleTableViewCell else {
            fatalError("Cell not found")
        }
        
        if let articleVM = self.articleListVM?.articleAtIndex(indexPath.row) {
            cell.titleLabel.text = articleVM.title
            cell.descriptionLabel.text = articleVM.description
        }
        
        
        return cell
    }
}
