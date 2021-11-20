//
//  GameMapper.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 08/11/21.
//

import Foundation

final class GameMapper {
    
    static func mapGameResponseToDomain(
        input gameResponse: [GameResponse]
    ) -> [GameModel] {
        
        return gameResponse.map { result in
            return GameModel(
                idGame: result.idGame,
                name: result.name,
                backgroundImage: result.backgroundImage,
                rating: result.rating,
                released: result.released,
                ratingsCount: result.ratingsCount
            )
        }
    }
    
    static func mapGameDetailResponseToDomain(
        input gameDetailResponse: GameDetailResponse
    ) -> GameDetailModel {
        
        return GameDetailModel(
            idGame: gameDetailResponse.idGame,
            name: gameDetailResponse.name,
            description: gameDetailResponse.description,
            backgroundImage: gameDetailResponse.backgroundImage,
            rating: gameDetailResponse.rating,
            ratingsCount: gameDetailResponse.ratingsCount,
            released: gameDetailResponse.released
        )
    }
    
    static func mapGameDetailModelToEntity(
        input gameDetailModel: GameDetailModel
    ) -> GameEntity {
        
        let newGame = GameEntity()
        newGame.idGame = gameDetailModel.idGame
        newGame.released = gameDetailModel.released ?? ""
        newGame.ratingsCount = gameDetailModel.ratingsCount
        newGame.rating = gameDetailModel.rating
        newGame.backgroundImage = gameDetailModel.backgroundImage ?? ""
        newGame.name = gameDetailModel.name
        return newGame
    }
    
    static func mapGameEntitiesToDomains(
        input gameEntities: [GameEntity]
    ) -> [GameModel] {
        
        return gameEntities.map { result in
            return GameModel(
                idGame: result.idGame,
                name: result.name,
                backgroundImage: result.backgroundImage,
                rating: result.rating,
                released: result.released,
                ratingsCount: result.ratingsCount
            )
        }
    }
    
}
