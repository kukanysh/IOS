//
//  ViewController.swift
//  ToDoList
//
//  Created by Куаныш Спандияр on 09.10.2024.
//

//MARK: - Imports

import UIKit
import SnapKit

//MARK: - ViewController

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let viewModel = ToDoViewModel()
    private let tableView = UITableView()
    private let bottomSheetView = UIView()
    private let textField = UITextField()
    private let descriptionField = UITextField()
 
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        setupBottomSheet()
        
        // Bind the ViewModel's closure to update the UI when the data changes
        viewModel.onTodoListUpdated = { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        tableView.reloadData() // Initial reload to display loaded items
    }
    
    //MARK: - UI setup
    
    private func setupUI() {
        // Add the title label at the top of the screen
        let titleLabel = UILabel()
        titleLabel.text = "Your ToDoList"
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            maker.left.equalToSuperview().inset(20)
        }
        
        // Add the table view below the title label
        view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(20)
            maker.left.right.bottom.equalToSuperview()
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Add a button to add a new to-do
        let addButton = UIButton(type: .system)
        addButton.setTitle("+ Add Todo", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        addButton.backgroundColor = .systemCyan
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.cornerRadius = 10
        
        view.addSubview(addButton)
        addButton.snp.makeConstraints { maker in
            maker.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(150)
            maker.height.equalTo(50)
        }
        
        addButton.addTarget(self, action: #selector(addTodoTapped), for: .touchUpInside)
    }
    
    //MARK: - Bottom sheet setup
    
    private func setupBottomSheet() {
        // Configure bottom sheet appearance
        bottomSheetView.backgroundColor = .white
        bottomSheetView.layer.cornerRadius = 35
        bottomSheetView.layer.shadowColor = UIColor.black.cgColor
        bottomSheetView.layer.shadowOpacity = 0.3
        bottomSheetView.layer.shadowRadius = 6
        view.addSubview(bottomSheetView)
        
        // Set up bottom sheet initially off-screen
        bottomSheetView.snp.makeConstraints { maker in
            maker.left.right.equalToSuperview()
            maker.height.equalTo(300)
            maker.bottom.equalTo(view.snp.bottom).offset(400) // Hidden initially
        }
        
        // Add a text field
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter Todo Title"
        bottomSheetView.addSubview(textField)
        textField.snp.makeConstraints { maker in
            maker.top.equalTo(bottomSheetView).offset(40)
            maker.left.equalTo(bottomSheetView).offset(20)
            maker.right.equalTo(bottomSheetView).inset(20)
        }
        
        // Add a description field
        descriptionField.borderStyle = .roundedRect
        descriptionField.placeholder = "Enter Todo Description"
        bottomSheetView.addSubview(descriptionField)
        descriptionField.snp.makeConstraints { maker in
            maker.top.equalTo(bottomSheetView).offset(90)
            maker.left.equalTo(bottomSheetView).offset(20)
            maker.right.equalTo(bottomSheetView).inset(20)
        }
        
        // Add a button to submit the new to-do
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("Add Todo", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        submitButton.backgroundColor = .systemBlue
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.layer.cornerRadius = 8
        bottomSheetView.addSubview(submitButton)
        submitButton.snp.makeConstraints { maker in
            maker.top.equalTo(textField.snp.bottom).offset(80)
            maker.centerX.equalTo(bottomSheetView)
            maker.width.equalTo(150)
            maker.height.equalTo(50)
        }
        
        submitButton.addTarget(self, action: #selector(submitTodoTapped), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    // Show/hide bottom sheet when tapping add button
    @objc private func addTodoTapped() {
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetView.snp.updateConstraints { maker in
                maker.bottom.equalTo(self.view.snp.bottom).offset(0) // Slide up
            }
            self.view.layoutIfNeeded() // Animate layout changes
        }
    }
    
    // Handle the submit button on the bottom sheet
    @objc private func submitTodoTapped() {
        guard let title = textField.text, !title.isEmpty else {
            // Hide the bottom sheet if the title is empty
            hideBottomSheet()
            return
        }
        
        // Add the new to-do item with the title and optional description
        let description = descriptionField.text ?? "" // Allow empty description
        viewModel.addTodoItem(title: title, description: description)
        
        // Clear the text fields after submission
        textField.text = ""
        descriptionField.text = ""
        
        // Hide the bottom sheet after adding the to-do item
        hideBottomSheet()
    }


    private func hideBottomSheet() {
        // Hide the bottom sheet
        UIView.animate(withDuration: 0.3) {
            self.bottomSheetView.snp.updateConstraints { maker in
                maker.bottom.equalTo(self.view.snp.bottom).offset(400) // Slide down
            }
            self.view.layoutIfNeeded() // Animate layout changes
        }
    }

    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let todoItem = viewModel.todoItems[indexPath.row]
        
        cell.textLabel?.text = todoItem.title
        cell.detailTextLabel?.text = todoItem.description
        
        
        cell.accessoryType = todoItem.isDone ? .checkmark : .none
        //cell.backgroundColor = todoItem.isDone ? .systemMint : .white
        
        return cell
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.toggleTodoItem(at: indexPath.row)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel.removeTodoItem(at: indexPath.row)
        }
    }
    
        
}




//
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
//    
//    private let viewModel = TodoViewModel()
//    private let tableView = UITableView()
//    
//    // MARK: - Lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        initialize()
//        
//    }
//    
//    
//    //MARK: - Interface
//    
//    private func initialize() {
//        view.backgroundColor = .white
//        
//        let label = UILabel()
//        label.text = "Hello, Kuanysh"
//        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
//        view.addSubview(label)
//        label.snp.makeConstraints { maker in
//            maker.left.equalToSuperview().inset(30)
//            maker.top.equalToSuperview().inset(60)
//        }
//        
//        let extraLabel = UILabel()
//        extraLabel.text = "Your \nProjects (4)"
//        extraLabel.numberOfLines = 0
//        extraLabel.font = UIFont.systemFont(ofSize: 45, weight: .heavy)
//        view.addSubview(extraLabel)
//        extraLabel.snp.makeConstraints { maker in
//            maker.left.equalToSuperview().inset(30)
//            maker.top.equalToSuperview().inset(75)
//        }
//        
////        let image = UIImage(named: "ava")
////        let profileImage = UIImageView(image: image!)
////        profileImage.frame = CGRect(x: 0, y: 0, width: 15, height: 30)
////        view.addSubview(profileImage)
////        profileImage.snp.makeConstraints { maker in
////            maker.left.equalToSuperview().inset(300)
////            maker.top.equalToSuperview().inset(55)
////        }
//        
//        let projects = UIButton(type: .system)
//        projects.backgroundColor = .systemCyan
//        projects.setTitleColor(.white, for: .normal)
//        projects.layer.cornerRadius = 45
//        projects.setTitle("Holidays in Kazakhstan", for: .normal)
//        view.addSubview(projects)
//        
//        projects.snp.makeConstraints { maker in
//            maker.centerX.equalToSuperview().inset(100)
//            maker.width.equalTo(370)
//            maker.height.equalTo(400)
//            maker.top.equalToSuperview().inset(200)
//            
//        }
//        
//        let buttonTitle = UILabel()
//        buttonTitle.text = "Holidays\nin Kazakhstan"
//        buttonTitle.numberOfLines = 0
//        buttonTitle.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
//        buttonTitle.textColor = .white
//        view.addSubview(buttonTitle)
//        buttonTitle.snp.makeConstraints { maker in
//            maker.left.equalToSuperview().inset(40)
//            maker.top.equalToSuperview().inset(225)
//        }
//        
//        //MARK: - Create button
//        
//        let create = UIButton(type: .system)
//        create.backgroundColor = .separator
//        create.setTitleColor(.white, for: .normal)
//        create.layer.cornerRadius = 30
//        create.setTitle("+", for: .normal)
//        create.titleLabel?.font = UIFont.systemFont(ofSize: 45)
//        view.addSubview(create)
//        create.snp.makeConstraints {maker in
//            //maker.centerX.equalToSuperview().inset(100)
//            maker.width.equalTo(60)
//            maker.height.equalTo(60)
//            maker.left.equalToSuperview().inset(300)
//            maker.top.equalToSuperview().inset(720)
//            
//        }
//        
//        create.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        
//    }
//    
//    //MARK: - button function
//    @objc private func buttonTapped() {
//        print("tapped button")
//    }
//
//
//}

