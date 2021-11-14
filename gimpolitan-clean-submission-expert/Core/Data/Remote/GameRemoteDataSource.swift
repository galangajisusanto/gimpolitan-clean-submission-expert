//
//  GameRemoteDataSource.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift

protocol GameRemoteDataSource {
    func getGames(query: String?) -> Observable<[GameResponse]>
    func getGameDetail(idGames: String) -> Observable<GameDetailResponse>
}
