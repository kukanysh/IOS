//
//  ViewController.swift
//  CoreGraphicsLearning
//
//  Created by Куаныш Спандияр on 30.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        drawCircle()
        
    }
    
    func drawCircle() {
        let renderer =  UIGraphicsImageRenderer(size: CGSize(width: 400, height: 400))
        
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: 400, height: 400).insetBy(dx: 10, dy: 10)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(20)
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        imageView.image = img
        
    }
    
}
    
//    let myView = MyView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        view.backgroundColor = .systemGray5
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        
//        view.addSubview(myView)
//        
//        NSLayoutConstraint.activate([
//            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            myView.widthAnchor.constraint(equalToConstant: 400),
//            myView.heightAnchor.constraint(equalToConstant: 400),
//        ])
//        
//        
//        print(UIScreen.main.bounds.size)
//        
//    }




//class MyView: UIView {
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func draw(_ rect: CGRect) {
//        guard let context = UIGraphicsGetCurrentContext() else { return }
//        
//        let rectangle1 = CGRect(x: 0, y: 0, width: 200, height: 180).insetBy(dx: 10, dy: 10)
//        context.setFillColor(UIColor.systemRed.cgColor)
//        context.setStrokeColor(UIColor.systemGreen.cgColor)
//        context.setLineWidth(20)
//        context.addRect(rectangle1)
//        context.drawPath(using: .fillStroke)
//        context.fill(rectangle1)
//        
//        
//        //painters model
//        
//        let rectangle2 = CGRect(x: 256, y: 256, width: 128, height: 128)
//        
//        context.setFillColor(UIColor.systemYellow.cgColor)
//        context.setStrokeColor(UIColor.systemBlue.cgColor)
//        context.setLineWidth(10)
//        context.addEllipse(in: rectangle2)
//        context.drawPath(using: .fillStroke)
//        
//        
//    }
//    
//}

