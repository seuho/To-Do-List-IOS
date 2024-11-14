//
//  User.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/10/24.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let dateJoined: TimeInterval
}
