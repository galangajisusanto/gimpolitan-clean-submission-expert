//
//  GameDetailResponse.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 12/11/21.
//

import Foundation

struct GameDetailResponse: Codable {
    let idGame: Int
    let name, description: String
    let backgroundImage: String?
    let rating: Double
    let ratingsCount: Double
    let released: String?

    enum CodingKeys: String, CodingKey {
        case name, released, rating
        case idGame = "id"
        case description = "description_raw"
        case backgroundImage = "background_image"
        case ratingsCount = "ratings_count"
    }
}
