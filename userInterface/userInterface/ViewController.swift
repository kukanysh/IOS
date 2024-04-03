//
//  ViewController.swift
//  userInterface
//
//  Created by Куаныш Спандияр on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.systemMint
        
        let myView = UIView()
        myView.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        myView.backgroundColor = .systemMint
        myView.clipsToBounds = true
        
        myView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4.0)
        
        print(myView.frame)
        print(myView.bounds)
        print(myView.center)
        
        let myView2 = UIView()
        myView.frame = CGRect(x: 100, y: 100, width: 200, height: 100)
        myView.backgroundColor = .magenta
        
        myView.addSubview(myView2)
        view.addSubview(myView)
        
        let Label = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 100))
        Label.text = "Hello World"
        Label.textAlignment = .center
        view.addSubview(Label)
        Label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4.0)
        
        let ImageView = UIImageView(frame: CGRect(x: 50, y: 400, width: 200, height: 200))
        
        ImageView.image = UIImage(systemName: "tree")
        ImageView.contentMode = .scaleAspectFit
        view.addSubview(ImageView)
        
        
        
    }


}

