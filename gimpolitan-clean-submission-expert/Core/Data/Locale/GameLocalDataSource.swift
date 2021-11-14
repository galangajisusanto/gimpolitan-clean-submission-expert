//
//  GameLocalDataSource.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 13/11/21.
//

import Foundation
import RxSwift

protocol GameLocalDataSource: AnyObject {
    func getGames() -> Observable<[GameEntity]>
    func addGame(from game: GameEntity) -> Observable<Bool>
    func removeGame(form gameId: Int) -> Observable<Bool>
    func searchGames(from name: String) -> Observable<[GameEntity]>
    func checkIsFavoriteGame(idGame: Int) -> Observable<Bool>
}
