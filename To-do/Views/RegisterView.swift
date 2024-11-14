//
//  RegisterView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organising Your Life", color1: .yellow, color2: .orange)
                .padding(.top, 140)
            
            VStack {
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(Color.red)
                }
                
                TextField("Username", text: $viewModel.username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
 
                
                TLButtonView(buttonName: "Create Account", buttonColor: .green) {
                    viewModel.register()
                }.padding()
            }
            .padding(50)
            .offset(y: -350)
        }
    }
}

#Preview {
    RegisterView()
}
