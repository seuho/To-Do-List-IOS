//
//  ProfileViewModel.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {
        
    }
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["userId"] as? String ?? "",
                                  username: data["username"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  dateJoined: data["dateJoined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    func logOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
