//
//  GameEntity.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import Foundation
import RealmSwift

class GameEntity: Object {
    @objc dynamic var idGame: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var backgroundImage: String = ""
    @objc dynamic var rating: Double = 0.0
    @objc dynamic  var ratingsCount: Double = 0.0
    @objc dynamic var released: String = ""
    override static func primaryKey() -> String? {
        return "idGame"
    }
}
