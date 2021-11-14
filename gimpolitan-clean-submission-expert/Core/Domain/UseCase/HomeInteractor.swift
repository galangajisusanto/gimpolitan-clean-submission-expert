//
//  GameUseCase.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift

protocol HomeUseCase {
    func getGames(query: String?)-> Observable<[GameModel]>
}

class HomeInteractor: HomeUseCase {
    private let repository: GameRepository
    required init(repository: GameRepository) {
        self.repository = repository
    }
    func getGames(query: String?) -> Observable<[GameModel]> {
        return repository.getGames(query: query)
    }
}
