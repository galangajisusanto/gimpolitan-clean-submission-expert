//
//  DetailInteractor.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 12/11/21.
//

import Foundation
import RxSwift

protocol DetailUseCase {
    func getGameDetail(idGame: String)-> Observable<GameDetailModel>
    func addGame(game: GameDetailModel) -> Observable<Bool>
    func removeGame(gameId: Int) -> Observable<Bool>
    func chekcIsFavoriteGameExist(idGame: Int) -> Observable<Bool>
}

class DetailInteractor: DetailUseCase {
    private let repository: GameRepository
    required init(repository: GameRepository) {
        self.repository = repository
    }
    func getGameDetail(idGame: String) -> Observable<GameDetailModel> {
        return repository.getGameDetail(idGame: idGame)
    }
    func addGame(game: GameDetailModel) -> Observable<Bool> {
        return repository.addFavoriteGame(game: game)
    }
    func removeGame(gameId: Int) -> Observable<Bool> {
        return repository.removeFavoriteGame(gameId: gameId)
    }
    func chekcIsFavoriteGameExist(idGame: Int) -> Observable<Bool> {
        return repository.checkisFavoriteGameExist(idGame: idGame)
    }
}
