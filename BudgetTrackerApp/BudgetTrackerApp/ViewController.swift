//
//  ViewController.swift
//  BudgetTrackerApp
//
//  Created by Куаныш Спандияр on 30.10.2024.
//e

import UIKit

class ViewController: UIViewController {
    
    private let viewmodel = BudgetViewModel()
    
    
    let expenseButton = UIButton(type: .system)
    let incomeButton = UIButton(type: .system)
    
    let descriptionField = UITextField()
    let amountField = UITextField()
    
    let stackView = UIStackView()
    
    private var balanceCard = UIView()
    private var incomeCard = UIView()
    private var expensesCard = UIView()
    
    
    var selectedTransactionType: TransactionType = .income
    
    var currentlySwipedRow: UIView?
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        updateTransactionList()
        
        
        
        viewmodel.onBudgetUpdated = { [weak self] totalIncome, totalExpenses, balance in
            guard let self = self else { return }
            print("Budget Updated: Income - \(totalIncome), Expenses - \(totalExpenses), Balance - \(balance)")
            self.updateCards(totalIncome: totalIncome, totalExpenses: totalExpenses, balance: balance)
        }

        
        
        
        viewmodel.calculateBudget()
        
        
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // Important: Match the width of the contentView to the scrollView's width
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        
        //MARK: - Gesture to hide the keyboard
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        contentView.addGestureRecognizer(tapGesture)
        
        
        //MARK: - Labels
        
        let budgetLabel = UILabel()
        budgetLabel.text = "Budget Tracker"
        budgetLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        budgetLabel.textColor = .black
        budgetLabel.textAlignment = .center
        budgetLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(budgetLabel)
        
        
        let totalBudgetLabel = UILabel()
        totalBudgetLabel.text = "Add your transactions"
        totalBudgetLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        totalBudgetLabel.textColor = .darkGray
        totalBudgetLabel.textAlignment = .center
        totalBudgetLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(totalBudgetLabel)
        
        
        
        // Create card views for Income, Expenses, and Balance
        incomeCard = createCardView(title: "Income", amount: viewmodel.totalIncome, color: .systemGreen)
        expensesCard = createCardView(title: "Expenses", amount: viewmodel.totalExpenses, color: .systemRed)
        balanceCard = createCardView(title: "Balance", amount: viewmodel.balance, color: .black)

        
        
        // Horizontal Stack View for Income and Expenses
        let incomeExpensesStackView = UIStackView(arrangedSubviews: [incomeCard, expensesCard])
        incomeExpensesStackView.axis = .horizontal
        incomeExpensesStackView.distribution = .fillEqually
        incomeExpensesStackView.spacing = 16
        incomeExpensesStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Vertical Stack View to hold Balance card on top of Income and Expenses
        let mainStackView = UIStackView(arrangedSubviews: [balanceCard, incomeExpensesStackView])
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        
        
        
        
        //MARK: - Recent transactions card
        
        let recentTransactionsLabel = UILabel()
        recentTransactionsLabel.text = "Recent Transactions"
        recentTransactionsLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        recentTransactionsLabel.textColor = .black
        recentTransactionsLabel.textAlignment = .center
        recentTransactionsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(recentTransactionsLabel)
        
        // Create the main card view to hold the scrollable content
        let cardView = createCard()
        contentView.addSubview(cardView)
        
        // Create the scroll view to allow scrolling
        let transactionScrollView = UIScrollView()
        transactionScrollView.translatesAutoresizingMaskIntoConstraints = false
        cardView.addSubview(transactionScrollView)

        
        // Create a vertical stack view to hold each transaction row
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        transactionScrollView.addSubview(stackView)
        
        
       
        
        
        
        // Set constraints for cardView
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 440),
            cardView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Set constraints for scrollView inside cardView
        NSLayoutConstraint.activate([
            transactionScrollView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            transactionScrollView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            transactionScrollView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
            transactionScrollView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10)
        ])
        
        // Set constraints for stackView inside scrollView
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: transactionScrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: transactionScrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: transactionScrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: transactionScrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: transactionScrollView.widthAnchor)
        ])
        
        
        //MARK: - Adding new transactions card
        
        let card = createCard()
        contentView.addSubview(card)
        
        // Title Label
        let addTransaction = UILabel()
        addTransaction.text = "Add New Transaction"
        addTransaction.textColor = .black
        addTransaction.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        addTransaction.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(addTransaction)
        
        let description = UILabel()
        description.text = "Description"
        description.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        description.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(description)
        
        
        //Description field
        descriptionField.placeholder = "Enter description"
        descriptionField.borderStyle = .roundedRect
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.font = UIFont.systemFont(ofSize: 17)
        card.addSubview(descriptionField)
        
        
        let amount = UILabel()
        amount.text = "Amount"
        amount.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        amount.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(amount)
        
        
        //Amount field
        amountField.placeholder = "Enter amount"
        amountField.borderStyle = .roundedRect
        amountField.translatesAutoresizingMaskIntoConstraints = false
        amountField.font = UIFont.systemFont(ofSize: 17)
        amountField.keyboardType = .decimalPad
        card.addSubview(amountField)
        
        
        
        // Configure expense button
        configureButton(expenseButton, title: "Expense", isSelected: false)
        expenseButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        // Configure income button
        configureButton(incomeButton, title: "Income", isSelected: true)
        incomeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        // Stack view to hold buttons
        let buttonStackView = UIStackView(arrangedSubviews: [expenseButton, incomeButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 30
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        card.addSubview(buttonStackView)

        // Set constraints
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            buttonStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 950)
        ])
        
        
        
        let addTransactionButton = UIButton(type: .system)
        addTransactionButton.setTitle("Add Transaction", for: .normal)
        addTransactionButton.backgroundColor = .black
        addTransactionButton.setTitleColor(.white, for: .normal)
        addTransactionButton.layer.cornerRadius = 10
        addTransactionButton.translatesAutoresizingMaskIntoConstraints = false
        addTransactionButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        card.addSubview(addTransactionButton)
        
        addTransactionButton.addTarget(self, action: #selector(addTransactionFunc), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            addTransactionButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            addTransactionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            addTransactionButton.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 1000),
            addTransactionButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        
        NSLayoutConstraint.activate([
            card.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 670),
            card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            card.heightAnchor.constraint(equalToConstant: 410),
            
            
            addTransaction.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 685),
            addTransaction.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            description.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 740),
            description.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            
            descriptionField.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 770),
            descriptionField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            descriptionField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            descriptionField.heightAnchor.constraint(equalToConstant: 50),
            
            amount.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 850),
            amount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 52),
            
            amountField.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 880),
            amountField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            amountField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            amountField.heightAnchor.constraint(equalToConstant: 50)
            
            
            ])
        
        
        
        //MARK: - Constraints
        
        NSLayoutConstraint.activate([
            // Total Budget Label
            budgetLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            budgetLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            totalBudgetLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 80),
            totalBudgetLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            
            // Balance card height constraint
            balanceCard.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 140),
            balanceCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            balanceCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            balanceCard.heightAnchor.constraint(equalToConstant: 100),
            
            // Income and Expenses cards height constraint
            incomeCard.heightAnchor.constraint(equalToConstant: 100),
            expensesCard.heightAnchor.constraint(equalToConstant: 100),
            
            
            //Recent transactions
            recentTransactionsLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 390),
            recentTransactionsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            ])
        
        
    }

    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Balance, Income, Expences card helper function
    
    func createCardView(title: String, amount: Double, color: UIColor) -> UIView {
        
        let cardView = UIView()
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.3
        cardView.layer.shadowRadius = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .gray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Amount Label
        let amountLabel = UILabel()
        let formattedAmount = "\(amount) ₸"  // Adding the tenge sign
        amountLabel.text = formattedAmount
        amountLabel.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        amountLabel.textColor = color
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add labels to the card view
        cardView.addSubview(titleLabel)
        cardView.addSubview(amountLabel)
        
        
        // Constraints for labels inside the card view
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
            
            amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            amountLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10)
        ])
        
        
        return cardView
        
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
    
    
    //MARK: - Row creator function
    
    // Helper function to create each transaction row
    func createTransactionRow(name: String, amount: String, color: UIColor) -> UIView {
        
        
        let rowView = UIView()
        rowView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        rowView.layer.cornerRadius = 8
        rowView.translatesAutoresizingMaskIntoConstraints = false
        
        // Name Label
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        rowView.addSubview(nameLabel)
        
        // Amount Label
        let amountLabel = UILabel()
        amountLabel.text = amount
        amountLabel.font = UIFont.boldSystemFont(ofSize: 16)
        amountLabel.textColor = color
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        rowView.addSubview(amountLabel)
        
        // Constraints for labels within row view
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: rowView.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor),
            
            amountLabel.trailingAnchor.constraint(equalTo: rowView.trailingAnchor, constant: -10),
            amountLabel.centerYAnchor.constraint(equalTo: rowView.centerYAnchor),
            
            rowView.heightAnchor.constraint(equalToConstant: 40) // Set height for each row
        ])
        
        return rowView
    }
    
    
    //MARK: - Expence-Income button function
    
    private func configureButton(_ button: UIButton, title: String, isSelected: Bool) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(systemName: isSelected ? "largecircle.fill.circle" : "circle"), for: .normal)
        button.tintColor = .black
        button.contentHorizontalAlignment = .left
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        
        
        if sender == expenseButton {
            configureButton(expenseButton, title: "Expense", isSelected: true)
            configureButton(incomeButton, title: "Income", isSelected: false)
            selectedTransactionType = .expense
            
            
        } else {
            configureButton(expenseButton, title: "Expense", isSelected: false)
            configureButton(incomeButton, title: "Income", isSelected: true)
            selectedTransactionType = .income
 
            
        }

    }
    
    //MARK: - Add transaction button function
    
    @objc func addTransactionFunc(_ sender: UIButton) {
        
        guard let title = descriptionField.text, !title.isEmpty else {
            
            let alert = UIAlertController(title: "Invalid Input", message: "Please enter a description", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            
            
            return
        }
        
        guard let amountText = amountField.text, let amount = Double(amountText) else {
            
            let alert = UIAlertController(title: "Invalid Input", message: "Please enter an amount", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
            
            return
        }
        
        
        
        viewmodel.addTransaction(title: title, amount: amount, type: selectedTransactionType)
        
        
        descriptionField.text = ""
        amountField.text = ""
        
        updateTransactionList()
        
        
    }
    
    //MARK: - Updating transaction list
    
    func updateTransactionList() {
        // Clear the existing rows
        for view in stackView.arrangedSubviews {
            stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        // Add each transaction as a row in the stack view
        for transaction in viewmodel.transactions {
            let formattedAmount = viewmodel.formattedAmount(for: transaction)

            // Create a container view for swipe functionality
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true

            // Add a delete button (initially hidden)
            let deleteButton = UIButton(type: .system)
            deleteButton.setTitle("Delete", for: .normal)
            deleteButton.backgroundColor = .red
            deleteButton.setTitleColor(.white, for: .normal)
            deleteButton.layer.cornerRadius = 15
            deleteButton.tag = viewmodel.transactions.firstIndex { $0.id == transaction.id } ?? -1
            deleteButton.addTarget(self, action: #selector(deleteTransaction(_:)), for: .touchUpInside)

            // Add the deleteButton to the containerView
            containerView.addSubview(deleteButton)
            deleteButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                deleteButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                deleteButton.topAnchor.constraint(equalTo: containerView.topAnchor),
                deleteButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
                deleteButton.widthAnchor.constraint(equalToConstant: 105),
            ])

            // Add the transaction row (overlaying the delete button)
            let row = createTransactionRow(
                name: transaction.description,
                amount: formattedAmount,
                color: colorForType(transaction.type)
            )

            containerView.addSubview(row)
            row.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                row.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                row.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
                row.topAnchor.constraint(equalTo: containerView.topAnchor),
                row.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            ])

            // Add swipe gesture recognizers to the row
            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            swipeGesture.direction = .left
            row.addGestureRecognizer(swipeGesture)

            let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe(_:)))
            rightSwipeGesture.direction = .right
            row.addGestureRecognizer(rightSwipeGesture)

            // Add a tap gesture recognizer to reset rows
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(resetRowPosition(_:)))
            view.addGestureRecognizer(tapGesture)

            // Add the containerView to the stackView
            stackView.addArrangedSubview(containerView)
        }
    }

    //MARK: - Swipe functions
    
    @objc func handleSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard let row = gesture.view else { return }
        
        // Reset any previously swiped row
        if let swipedRow = currentlySwipedRow, swipedRow != row {
            UIView.animate(withDuration: 0.3) {
                swipedRow.transform = .identity
            }
        }
        
        // Animate the current row to reveal the delete button
        UIView.animate(withDuration: 0.3) {
            row.transform = CGAffineTransform(translationX: -80, y: 0)
        }
        
        currentlySwipedRow = row
    }
    
    @objc func handleRightSwipe(_ gesture: UISwipeGestureRecognizer) {
        guard let row = gesture.view, row == currentlySwipedRow else { return }

        // Animate the row back to its original position
        UIView.animate(withDuration: 0.3) {
            row.transform = .identity
        }

        currentlySwipedRow = nil
    }


    
    @objc func resetRowPosition(_ gesture: UITapGestureRecognizer) {
        if let swipedRow = currentlySwipedRow {
            UIView.animate(withDuration: 0.3) {
                swipedRow.transform = .identity
            }
            currentlySwipedRow = nil
        }
    }


    
    //MARK: - Deleting transaction
    
    @objc func deleteTransaction(_ sender: UIButton) {
        guard sender.tag >= 0, sender.tag < viewmodel.transactions.count else { return }
        let transaction = viewmodel.transactions[sender.tag]
        
        // Show confirmation alert
        let alert = UIAlertController(title: "Delete Transaction", message: "Are you sure you want to delete this transaction?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.viewmodel.deleteTransaction(id: transaction.id)
            self.updateTransactionList()  // Refresh the list after deletion
        }))
        
        present(alert, animated: true, completion: nil)
    }


    
    //MARK: - Color function
    
    func colorForType(_ type: TransactionType) -> UIColor {
        switch type {
        case .income:
            return .systemGreen
        case .expense:
            return .systemRed
        }
    }
    
    
    //MARK: - Updating the cards value
    // Method to update the cards
    private func updateCards(totalIncome: Double, totalExpenses: Double, balance: Double) {
        // Update labels in the income card
        updateCard(incomeCard, withAmount: totalIncome, color: .systemGreen)
        
        // Update labels in the expenses card
        updateCard(expensesCard, withAmount: totalExpenses, color: .systemRed)
        
        // Update labels in the balance card
        updateCard(balanceCard, withAmount: balance, color: .black)
    }

    // Helper function to update card views
    private func updateCard(_ card: UIView, withAmount amount: Double, color: UIColor) {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0 // Remove unnecessary zeros
        let formattedAmount = formatter.string(from: NSNumber(value: amount)) ?? "0"
        
        for subview in card.subviews {
            if let amountLabel = subview as? UILabel, amountLabel.font.pointSize == 25 {
                amountLabel.text = "\(formattedAmount) ₸"
                amountLabel.textColor = color
            }
        }
    }
    
    //MARK: - Keyboard functions

    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        // Adjust the content or view
        let keyboardHeight = keyboardFrame.height
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -keyboardHeight // Move view up
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0 // Reset view position
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}

