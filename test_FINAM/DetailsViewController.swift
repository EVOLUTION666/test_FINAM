//
//  DelailsViewController.swift
//  test_FINAM
//
//  Created by Andrey on 19.09.2021.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var titleLabel = UILabel()
    var authorLabel = UIView()
    var nameLabel = UIView()
    var descriptionLabel = UILabel()
    var imageView = UIImageView()
    
    var oneNews: Article?
    
    var stackView = UIStackView()
    
    private let backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .white
        return backgroundView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundView)
        
        backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    
        configureImageView()
        configureLabels()
        configure()
    }
    
    func configure() {
//        imageView.load(urlString: oneNews?.urlToImage! ?? "")
        imageView.loadImage(fromURL: oneNews?.urlToImage! ?? "")
        titleLabel.text = oneNews?.title
        descriptionLabel.text = oneNews?.articleDescription
    }
    
    func configureImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true

        backgroundView.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.3).isActive = true

    }
    
    func configureLabels() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        
        backgroundView.addSubview(titleLabel)
        backgroundView.addSubview(descriptionLabel)
        
        titleLabel.topAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        descriptionLabel.heightAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3).isActive = true
        
    }
}
