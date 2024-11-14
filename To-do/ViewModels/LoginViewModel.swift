//
//  LoginViewModel.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseAuth
import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {
        
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
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
        
        return true
        
    }
}
