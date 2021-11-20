//
//  GameRepository.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift

protocol GameRepository {
    func getGames(query: String?) -> Observable<[GameModel]>
    func getGameDetail(idGame: String) -> Observable<GameDetailModel>
    func getFavoriteGames() -> Observable<[GameModel]>
    func addFavoriteGame(game: GameDetailModel) -> Observable<Bool>
    func removeFavoriteGame(gameId: Int) -> Observable<Bool>
    func searchFavoriteGame(name: String) -> Observable<[GameModel]>
    func checkisFavoriteGameExist(idGame: Int) -> Observable<Bool>
}
