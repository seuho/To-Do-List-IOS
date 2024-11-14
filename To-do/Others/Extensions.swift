//
//  Extensions.swift
//  To-do
//
//  Created by Yashasvi Pamu on 11/11/24.
//

import Foundation

extension Encodable {
    func asDisctionary() -> [String: Any] {
        guard let data =  try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
