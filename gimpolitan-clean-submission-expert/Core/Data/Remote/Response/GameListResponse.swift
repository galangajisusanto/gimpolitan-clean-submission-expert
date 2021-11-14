//
//  GameEntity.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation

struct GameListResponse: Codable {
    let results: [GameResponse]
}

struct GameResponse: Codable {
    let idGame: Int
    let name: String
    let backgroundImage: String?
    let rating: Double
    let released: String?
    let ratingsCount: Double
    enum CodingKeys: String, CodingKey {
        case name, released
        case backgroundImage = "background_image"
        case rating
        case idGame = "id"
        case ratingsCount = "ratings_count"
    }
}
