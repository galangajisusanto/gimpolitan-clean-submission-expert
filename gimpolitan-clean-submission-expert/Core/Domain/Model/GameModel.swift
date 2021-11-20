//
//  GameModel.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation

struct GameModel {
    let idGame: Int
    let name: String
    let backgroundImage: String?
    let rating: Double
    let released: String?
    let ratingsCount: Double
    var dateText: String {
        guard let releaseDate = released, let date = DateUtils.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return DateUtils.dateTextFormatter.string(from: date)
    }
}
