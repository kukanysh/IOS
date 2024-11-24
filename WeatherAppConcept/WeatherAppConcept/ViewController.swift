//
//  ViewController.swift
//  WeatherAppConcept
//
//  Created by Куаныш Спандияр on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var cityName: UILabel!
    
    let cities = ["Shymkent", "New York", "Rome", "Milan", "Paris"]
    
    @IBOutlet var dateToday: UILabel!
    
    let dates = ["Wednesday-26 May", "Monday-19 August"]
    
    
    @IBOutlet var temperature: UILabel!
    
    let temperatures = ["30º", "19º", "25º", "27º"]
    
    
    @IBOutlet var tempText: UILabel!
    
    let texts = ["The floor is lava", "Weather is furious today"]
    
    
    @IBOutlet var minMaxTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func searchButtonPressed(_ sender: Any) {
        
        print("Search button is pressed")
        
    }
    
    
    
    @IBAction func shuffleButton(_ sender: Any) {
        
        print("button is pressed")
        
        var randomNum = Int.random(in: 0...(cities.count - 1))
        
        cityName.text = cities[randomNum]
        
        randomNum = Int.random(in: 0...(dates.count - 1))
        
        dateToday.text = dates[randomNum]
        
        randomNum = Int.random(in: 0...(temperatures.count - 1))
        
        temperature.text = temperatures[randomNum]
        
        randomNum = Int.random(in: 0...(texts.count - 1))
        
        tempText.text = texts[randomNum]
        
        
        
        
    }
    
    
    @IBOutlet var scroll: UIScrollView!
    
    @IBOutlet var imageSet: UIImageView!
}

