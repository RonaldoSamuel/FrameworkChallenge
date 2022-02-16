//
//  AlbumCodable.swift
//  FrameworkChallange
//
//  Created by Ronaldo Filho on 16/02/22.
//

import Foundation

// MARK: - AlbumCodableElement
struct AlbumCodableElement: Codable {
    let userID, id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title
    }
}

typealias AlbumCodable = [AlbumCodableElement]
