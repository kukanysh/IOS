//
//  ViewController.swift
//  Application
//
//  Created by Куаныш Спандияр on 17.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cityName: UILabel!
    
    @IBOutlet var date: UILabel!
    
    
    @IBOutlet var temperature: UILabel!
    
    @IBOutlet var texting: UILabel!
    
    @IBOutlet var minMaxTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButton(_ sender: Any) {
        print("Search is used")
    }
    
    
}
