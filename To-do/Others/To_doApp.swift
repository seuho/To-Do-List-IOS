//
//  To_doApp.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//
import FirebaseCore
import SwiftUI

@main
struct To_doApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
