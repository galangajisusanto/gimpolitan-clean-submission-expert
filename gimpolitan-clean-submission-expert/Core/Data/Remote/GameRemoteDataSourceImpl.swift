//
//  GameRemoteDataSourceImpl.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift
import Alamofire

class GameRemoteDataSourceImpl: GameRemoteDataSource {
    
    func getGames(query: String?) -> Observable<[GameResponse]> {
        return Observable<[GameResponse]>.create {observer in
            if let url = URL(string: Endpoints.Gets.games.url) {
                var parameters = ["key": API.key]
                if let searchQuery = query {
                    parameters["search"] = searchQuery
                }
                AF.request(url, parameters: parameters)
                    .validate()
                    .responseDecodable(of: GameListResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value.results)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getGameDetail(idGames: String) -> Observable<GameDetailResponse> {
        return Observable<GameDetailResponse>.create {observer in
            if let url = URL(string: "\(Endpoints.Gets.gameDetails.url)\(idGames)") {
                let parameter = ["key": API.key]
                AF.request(url, parameters: parameter)
                    .validate()
                    .responseDecodable(of: GameDetailResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            observer.onNext(value)
                            observer.onCompleted()
                        case .failure:
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
}
