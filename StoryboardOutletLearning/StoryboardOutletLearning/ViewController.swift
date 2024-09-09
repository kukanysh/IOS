//
//  ViewController.swift
//  StoryboardOutletLearning
//
//  Created by Куаныш Спандияр on 19.08.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    
    let greetings = ["hello", "bonjour", "salem", "hola"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func button1Pressed(_ sender: Any) {
        
        print("button 1 is pressed")
        let randomNum = Int.random(in: 0...greetings.count - 1)
        label1.text = greetings[randomNum]
    }
    
}

