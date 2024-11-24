//
//  Model.swift
//  NewsApp
//
//  Created by Куаныш Спандияр on 28.02.2024.
//

import SwiftUI
import SwiftyJSON
import SDWebImageSwiftUI
import WebKit

struct dataType: Identifiable, Decodable, Encodable, Equatable {
    var id : String
    var title: String
    var description: String
    var url: String
    var image: String
    var isSaved: Bool = false
}

class getData: ObservableObject {
    @Published var datas = [dataType]()
    
    init(type: String) {
        
        let apiKey = "a4490e3c26c14d15b30a06ea958a1c2a"
        let source = "https://newsapi.org/v2/\(type)?country=us&category=business&apiKey=\(apiKey)"
        
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            for item in json["articles"]{
                let title = item.1["title"].stringValue
                let description = item.1["description"].stringValue
                let url = item.1["url"].stringValue
                let image = item.1["urlToImage"].stringValue
                let id = item.1["publishedAt"].stringValue
                
                
                DispatchQueue.main.async {
                    self.datas.append(dataType(id: id, title: title, description: description, url: url, image: image))
                }
                
                
                
                
            }
            
        }.resume()
        
        
    }
    
}

struct webView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: UIViewRepresentableContext<webView>) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: URL(string: url)!))
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<webView>) {
        
    }
    
}


