//
//  ViewController.swift
//  Application
//
//  Created by Куаныш Спандияр on 17.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var locationManager = LocationManager()
    
    
    @IBOutlet var imageName: UIImageView!
    
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var cityName: UILabel!
    
    @IBOutlet var date: UILabel!
    
    @IBOutlet var temperature: UILabel!
    
    @IBOutlet var temperatureText: UILabel!
    
    @IBOutlet var minMaxTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}


let url = ""

struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    
}

