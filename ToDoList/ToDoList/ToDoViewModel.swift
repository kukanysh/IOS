//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Куаныш Спандияр on 11.10.2024.
//

import Foundation


class ToDoViewModel {
    
    // Observable list of TodoItems
    private(set) var todoItems: [ToDoitem] = [] {
        didSet {
            // Notify the listener when the todoItems array is updated
            onTodoListUpdated?(todoItems)
        }
    }
    
    // Closure that will be called when the todoItems are updated
    var onTodoListUpdated: (([ToDoitem]) -> Void)?
    
    
    private let tasksKey = "tasksKey"
    
    init() {
        loadTasks()
    }
    
    
    
    
    // Add a new to-do
    func addTodoItem(title: String, description: String) {
        let newTodo = ToDoitem(id: UUID(), title: title, description: description, isDone: false)
        todoItems.append(newTodo)
        saveTasks()
    }
    
    // Toggle the completion status of a to-do
    func toggleTodoItem(at index: Int) {
        todoItems[index].isDone.toggle()
        saveTasks()
    }
    
    // Remove a to-do
    func removeTodoItem(at index: Int) {
        todoItems.remove(at: index)
        saveTasks()
    }
    
    
    //MARK: - Persistence with UserDefaults
    
    // Load tasks from UserDefaults
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: tasksKey),
           let savedTasks = try? JSONDecoder().decode([ToDoitem].self, from: data) {
            todoItems = savedTasks
        }
    }
    
    // Save tasks to UserDefaults
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.set(encoded, forKey: tasksKey)
        }
    }

    
    
}

