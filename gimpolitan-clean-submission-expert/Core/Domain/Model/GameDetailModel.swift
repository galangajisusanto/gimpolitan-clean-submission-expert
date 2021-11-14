//
//  GameDetailModel.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 12/11/21.
//

import Foundation

struct GameDetailModel {
    let idGame: Int
    let name, description: String
    let backgroundImage: String?
    let rating: Double
    let ratingsCount: Double
    let released: String?
    var dateText: String {
        guard let releaseDate = released, let date = DateUtils.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return DateUtils.dateTextFormatter.string(from: date)
    }
}
