//
//  DetailPresenter.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 12/11/21.
//

import Foundation
import RxSwift

class DetailPresenter {
    private let disposeBag = DisposeBag()
    private let detailUseCase: DetailUseCase
    var gameDetail = PublishSubject<GameDetailModel>()
    var errorMessage = PublishSubject<String>()
    var loadingState = PublishSubject<Bool>()
    var addGameStatus = PublishSubject<Bool>()
    var removeGameStatus = PublishSubject<Bool>()
    var isGameFavorite = PublishSubject<Bool>()
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func getGamesDetal(idGames: String) {
        loadingState.onNext(true)
        detailUseCase.getGameDetail(idGame: idGames)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.gameDetail.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    func addGame(game: GameDetailModel) {
        loadingState.onNext(true)
        detailUseCase.addGame(game: game)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.addGameStatus.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    
    func removeGame(gameId: Int) {
        loadingState.onNext(true)
        detailUseCase.removeGame(gameId: gameId)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.removeGameStatus.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    
    func checkIsFavoriteGameExist(idGame: Int) {
        loadingState.onNext(true)
        detailUseCase.chekcIsFavoriteGameExist(idGame: idGame)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.isGameFavorite.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    
}
