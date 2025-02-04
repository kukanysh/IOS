//
//  ViewController.swift
//  CaloriesTracker
//
//  Created by Куаныш Спандияр on 09.01.2025.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    private var caloriesCard = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view.backgroundColor = .white
        
        
        //MARK: - Title
        
        let title = UILabel()
        title.text = "Calories Tracker"
        title.textColor = .black
        title.font = .systemFont(ofSize: 35, weight: .bold)
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
        
        
        //MARK: - Notification Button
        

        
        
        //MARK: - View
        
        let today = UILabel()
        today.text = "Today"
        today.textColor = .black
        today.font = .systemFont(ofSize: 20, weight: .semibold)
        today.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(today)
        
        
        NSLayoutConstraint.activate([
            today.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            today.topAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor, constant: 20)

        ])
        
        let yesterday = UILabel()
        yesterday.text = "Yesterday"
        yesterday.textColor = .black
        yesterday.font = .systemFont(ofSize: 20, weight: .semibold)
        yesterday.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yesterday)
        
        NSLayoutConstraint.activate([
            yesterday.leadingAnchor.constraint(equalTo: today.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            yesterday.topAnchor.constraint(equalTo: title.safeAreaLayoutGuide.bottomAnchor, constant: 20)
            
            
        ])
        
        caloriesCard = createCard()
        view.addSubview(caloriesCard)
        
        NSLayoutConstraint.activate([
            
            caloriesCard.topAnchor.constraint(equalTo:
                today.safeAreaLayoutGuide.bottomAnchor, constant: 30),
            caloriesCard.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            caloriesCard.heightAnchor.constraint(equalToConstant: 150),
            caloriesCard.widthAnchor.constraint(equalToConstant: 360)
            
        ])
        
        
        
        
        
        
        
    }
    
    //MARK: - Card creator function
    
    func createCard() -> UIView {
        
        let cardView = UIView()
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return cardView
        
    }


}

