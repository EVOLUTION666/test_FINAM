//
//  NewsCell.swift
//  test_FINAM
//
//  Created by Andrey on 17.09.2021.
//

import UIKit

class NewsCell: UITableViewCell {
    
    var newsImageView = UIImageView()
//    var sourceName = UILabel()
//    var authorName = UILabel()
    var newsName = UILabel()
    var newsDescription = UILabel()
    
    var stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImageView)
        addSubview(newsName)
        addSubview(newsDescription)
        
        configureImageView()
        configureLabels()
        setImageConstraints()
        setStackView()
        setLabelsConnstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(news: Article) {
        newsImageView.load(urlString: news.urlToImage ?? "")
        newsName.text = news.title
        newsDescription.text = news.articleDescription
    }
    
    func configureImageView() {
        newsImageView.layer.cornerRadius = 10
        newsImageView.clipsToBounds = true
    }
    
    func configureLabels() {
        newsName.numberOfLines = 0
        newsName.font = UIFont(name: "San Francisco", size: 30)
        
        newsDescription.numberOfLines = 1
        newsDescription.adjustsFontSizeToFitWidth = false
    }
    
    func setImageConstraints() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setLabelsConnstraints() {
        newsName.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
    }
    
    func setStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        
        addSubview(stackView)
        
        //Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: 20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 280).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
//        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
//        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
//        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true

        stackView.addArrangedSubview(newsName)
        stackView.addArrangedSubview(newsDescription)
    }
    
}
