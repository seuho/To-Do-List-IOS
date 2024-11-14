//
//  LoginView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get Things Done!", color1: .primary, color2: .blue).padding(.top, 80)
                
                
                //LoginForm
                VStack {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButtonView(buttonName: "Log In", buttonColor: .blue) {
                        viewModel.login()
                    }.padding()
                }
                .frame(height: 50)
                .padding(30)
                .offset(y: -250)
                
                //CreateAccount
                VStack {
                    Text("New around here?")
                    NavigationLink("Create Account", destination: RegisterView())
                }.padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    let viewModel = LoginViewModel() // Instantiate a new instance of LoginViewModel for preview purposes
    return LoginView(viewModel: viewModel)
}
