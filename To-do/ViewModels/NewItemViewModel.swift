//
//  NewItemViewModel.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import Firebase
import FirebaseAuth
import SwiftUI
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var dueDate = Date()
    @Published var showAlert: Bool = false
    
    init() {
        
    }
    
    func save() {
        guard canSave else {
            return
        }
        
        // Get Current UserId
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(id: newId,
                                  title: title,
                                  description: description,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                  isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDisctionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
