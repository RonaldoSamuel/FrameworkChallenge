//
//  TodoCodable.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

// MARK: - TodoCodableElement
struct TodoCodableElement: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

typealias TodoCodable = [TodoCodableElement]
