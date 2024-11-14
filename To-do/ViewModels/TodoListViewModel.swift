//
//  TodoListViewModel.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseFirestore
import Foundation

class TodoListViewModel: ObservableObject {
    @Published var showingNewItemView: Bool = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
