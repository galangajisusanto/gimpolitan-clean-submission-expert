//
//  GameRepositoryImpl.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift

class GameRepositoryImpl: GameRepository {
    private let gameRemoteDataSource: GameRemoteDataSource
    private let gameLocalDataSource: GameLocalDataSource
    init(remoteDataSource: GameRemoteDataSource, localDataSource: GameLocalDataSource) {
        self.gameRemoteDataSource = remoteDataSource
        self.gameLocalDataSource = localDataSource
    }
    func getGames(query: String?) -> Observable<[GameModel]> {
        return gameRemoteDataSource
            .getGames(query: query)
            .map {GameMapper.mapGameResponseToDomain(input: $0)}
    }
    func getGameDetail(idGame: String) -> Observable<GameDetailModel> {
        return gameRemoteDataSource
            .getGameDetail(idGames: idGame)
            .map {GameMapper.mapGameDetailResponseToDomain(input: $0)}
    }
    func getFavoriteGames() -> Observable<[GameModel]> {
        return gameLocalDataSource.getGames()
            .map {GameMapper.mapGameEntitiesToDomains(input: $0)}
    }
    func addFavoriteGame(game: GameDetailModel) -> Observable<Bool> {
        return gameLocalDataSource
            .addGame(from: GameMapper.mapGameDetailModelToEntity(input: game))
    }
    func removeFavoriteGame(gameId: Int) -> Observable<Bool> {
        return gameLocalDataSource
            .removeGame(form: gameId)
    }
    func searchFavoriteGame(name: String) -> Observable<[GameModel]> {
        return gameLocalDataSource
            .searchGames(from: name)
            .map {GameMapper.mapGameEntitiesToDomains(input: $0)}
    }
    func checkisFavoriteGameExist(idGame: Int) -> Observable<Bool> {
        return gameLocalDataSource
            .checkIsFavoriteGame(idGame: idGame )
    }
}
