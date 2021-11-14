//
//  FavoriteInteractor.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 14/11/21.
//

import Foundation
import RxSwift

protocol FavoriteUseCase {
    func getFavoriteGames()-> Observable<[GameModel]>
    func searchGames(name: String) -> Observable<[GameModel]>
}

class FavoriteInteractor: FavoriteUseCase {
    private let repository: GameRepository
    required init(repository: GameRepository) {
        self.repository = repository
    }
    func getFavoriteGames() -> Observable<[GameModel]> {
        return repository.getFavoriteGames()
    }
    func searchGames(name: String) -> Observable<[GameModel]> {
        return repository.searchFavoriteGame(name: name)
    }
}
