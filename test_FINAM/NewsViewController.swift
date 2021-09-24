//
//  NewsViewController.swift
//  test_FINAM
//
//  Created by Andrey on 17.09.2021.
//

import UIKit

class NewsViewController: UIViewController {
    
    var tableView = UITableView()
    
    let service = Service()
    
    var news = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        title = "Breaking New's"
        
        service.fetchData { (data) in
            self.news = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.pin(to: view)
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
        tableView.rowHeight = 300
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
        let newsInCell =  news[indexPath.row]
        
        cell.set(news: newsInCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rootVC = DetailsViewController()
        
        rootVC.oneNews = news[indexPath.row]
        
        let navVC = UINavigationController(rootViewController: rootVC)
        self.present(navVC, animated: true)
    }
    
}
