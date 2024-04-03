//
//  ViewController.swift
//  mvvm
//
//  Created by Куаныш Спандияр on 02.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.userButtonPressed(login: (loginField.text ?? ""), password: passField.text ?? "")
    }
    @IBOutlet var label: UILabel!
    
    var viewModel = ViewModel()
    
    func initialState() {
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        initialState()
    }
    
    func bindViewModel(){
        viewModel.statusText.bind({ (statusText) in
             DispatchQueue.main.async {
                self.label.text = statusText
            }
        })
        
        viewModel.statusColor.bind({( statusColor) in
            DispatchQueue.main.async {
               self.label.textColor = statusColor
           }
        })
    }

}
