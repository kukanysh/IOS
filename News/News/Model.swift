//
//  Model.swift
//  News
//
//  Created by Куаныш Спандияр on 03.03.2024.
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
}

class getData: ObservableObject {
    @Published var datas = [dataType]()
    
    init(type: String) {
        
        let apiKey = "a4490e3c26c14d15b30a06ea958a1c2a"
        let source = "https://newsapi.org/v2/\(type)?q=apple&from=2024-03-01&to=2024-03-01&sortBy=popularity&apiKey=\(apiKey)"
        
        
        let url = URL(string: source)!
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            for i in json["articles"]{
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let image = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                
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


