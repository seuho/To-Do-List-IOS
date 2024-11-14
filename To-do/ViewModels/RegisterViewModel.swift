//
//  RegisterViewModel.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewModel : ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var confirmPassword: String = ""
    @Published var errorMessage: String = ""
    
    init () {
        
    }
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self]result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id,
                           username: username,
                           email: email,
                           dateJoined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users").document(id).setData(newUser.asDisctionary())
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessage = "Please fill in all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 8 else{
            errorMessage = "Password must be at least 8 characters long"
            return false
        }
        
        guard confirmPassword == password else {
            errorMessage = "Please enter the same password"
            return false
        }
        
        return true
        
    }
}
