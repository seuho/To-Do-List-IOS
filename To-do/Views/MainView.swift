//
//  ContentView.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentuserId.isEmpty {
            accountView
        }
        else {
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView(userId: viewModel.currentuserId).tabItem{
                Label("Home", systemImage: "house")
            }
            
            ProfileView().tabItem{
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    MainView()
}
