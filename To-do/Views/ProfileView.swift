//
//  ProfileView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
     var body: some View {
         NavigationView {
             VStack {
                 if let user = viewModel.user {
                     profile(user: user)
                 }
                 else {
                     Text("Loading Profile...")
                 }
             }
             .navigationTitle("Profile")
         }.onAppear{
             viewModel.fetchUser()
         }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        ProfilePictureView()
            
        // Info: Name, Email, Member Since
        VStack(alignment: .leading){
            HStack{
                Text("Username:").bold()
                Text(user.username)
            }.padding(.top, 10)
            HStack{
                Text("Email:").bold()
                Text(user.email)
            }.padding(.top, 10)
            HStack{
                Text("Member Since:").bold()
                Text("\(Date(timeIntervalSince1970: user.dateJoined).formatted(date: .abbreviated, time: .shortened))")
            }.padding(.top, 10)
        }.padding()
        
        // Sign out
        Button("Log Out"){
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
