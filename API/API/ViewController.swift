//
//  ViewController.swift
//  API
//
//  Created by Куаныш Спандияр on 03.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://logo.clearbit.com/:domain")!
        URLSession.shared.fetchData(at: url) { result in
            print(result)
        }
    }


}


extension URLSession {
    func fetchData(at url: URL, completion: @escaping (Result<[ToDo], Error>) -> Void ){
        self.dataTask(with: url) { data, response, error in
            if data != nil && error == nil  {
                do {
                    let fetchingData = try JSONDecoder().decode([ToDo].self, from: data!)
                    completion(.success(fetchingData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

