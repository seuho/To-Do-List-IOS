//
//  TodoListItem.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import Foundation

struct TodoListItem : Codable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
