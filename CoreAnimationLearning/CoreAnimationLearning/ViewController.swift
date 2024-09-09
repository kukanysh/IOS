//
//  ViewController.swift
//  CoreAnimationLearning
//
//  Created by Куаныш Спандияр on 18.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
//    let redView = UIView(frame: CGRect(x: 20, y: 100, width: 140, height: 100))
    
    let redView = UIView()
    let _width: CGFloat = 40
    let _height: CGFloat = 40
    
    let redCircle = UIImageView()
    let _diameter: CGFloat = 300

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redView.backgroundColor = .systemRed
        
        view.addSubview(redView)
        view.addSubview(redCircle)
//        animate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        redView.frame = CGRect(x: view.bounds.midX - _width/2, y: view.bounds.midY - _height/2, width: _width, height: _height)
        
        redCircle.frame = CGRect(x: view.bounds.midX - _diameter/2, y: view.bounds.midY - _diameter/2, width: _diameter, height: _diameter)
        
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: _diameter, height: _diameter))
        
        let img = renderer.image { ctx in
            let rectangle = CGRect(x: 0, y: 0, width: _diameter, height: _diameter)
            
            ctx.cgContext.setStrokeColor(UIColor.red.cgColor)
            ctx.cgContext.setFillColor(UIColor.clear.cgColor)
            ctx.cgContext.setLineWidth(1)
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
            
        }
        
        redCircle.image = img
        
        animate()
        
    }
    
    
    func animate() {
//        move animation
//        let animation = CABasicAnimation()
//        animation.keyPath = "position.x"
//        animation.fromValue = 20 + 140/2
//        animation.toValue = 300
//        animation.duration = 1
//        
//        redView.layer.add(animation, forKey: "basic")
//        redView.layer.position = CGPoint(x: 300, y: 100 + 100/2)
        
        
//        scale animation
//        let animation = CABasicAnimation()
//        animation.keyPath = "transform.scale"
//        animation.fromValue = 1
//        animation.toValue = 2
//        animation.duration = 0.4
//        
//        
//        redView.layer.add(animation, forKey: "basic")
//        redView.layer.transform = CATransform3DMakeScale(2, 2, 1)
        
//        rotate animation
//        let animation = CABasicAnimation()
//        animation.keyPath = "transform.rotation.z"
//        animation.fromValue = 0
//        animation.toValue = CGFloat.pi / 4
//        animation.duration = 1
//        
//        
//        redView.layer.add(animation, forKey: "basic")
//        redView.layer.transform = CATransform3DMakeRotation(CGFloat.pi / 4, 0, 0, 1)
        
//        shake animation
//        let animation = CAKeyframeAnimation()
//        animation.keyPath = "position.x"
//        animation.values = [0, 10, -10, 10, 0]
//        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
//        animation.duration = 0.4
//        
//        animation.isAdditive = true
//        redView.layer.add(animation, forKey: "shake")
        
//        circling animation
        
        let boundingRect = CGRect(x: -_diameter/2, y: -_diameter/2, width: _diameter, height: _diameter)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        
        orbit.path = CGPath(ellipseIn: boundingRect, transform: nil)
        
        orbit.duration = 2
        orbit.isAdditive = true
        orbit.calculationMode = CAAnimationCalculationMode.paced
        orbit.rotationMode = CAAnimationRotationMode.rotateAuto
        
        
        redView.layer.add(orbit, forKey: "redbox")
        
    }


}

