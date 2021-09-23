//
//  Service.swift
//  test_FINAM
//
//  Created by Andrey on 17.09.2021.
//

import Foundation

struct Service {
    let API_KEY = "ec694b4bb50b4ff48809bc9c0a00a999"
    func fetchData(completionHandler: @escaping ([Article])->()) {
        let url = URL(string: "https://newsapi.org/v2/everything?q=Apple&from=2021-09-17&sortBy=popularity&apiKey=\(API_KEY)")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error?.localizedDescription ?? "Неизвестная ошибка")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(News.self, from: data!)
                print(result)
                completionHandler(result.articles)
            } catch {
                print(error)
            }
        }.resume()
    }
}
