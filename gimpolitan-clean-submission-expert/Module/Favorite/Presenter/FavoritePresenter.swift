//
//  FavoritePresenter.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 14/11/21.
//

import Foundation
import RxSwift

class FavoritePresenter {
    private let disposeBag = DisposeBag()
    private let favoriteUseCase: FavoriteUseCase
    private let router = FavoriteRouter()
    var games = PublishSubject<[GameModel]>()
    var errorMessage = PublishSubject<String>()
    var loadingState = PublishSubject<Bool>()
    
    init(favoriteUseCase: FavoriteUseCase) {
        self.favoriteUseCase = favoriteUseCase
    }
    
    func getFavotiteGames() {
        loadingState.onNext(true)
        favoriteUseCase.getFavoriteGames()
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.games.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    
    func serchGames(name: String) {
        loadingState.onNext(true)
        favoriteUseCase.searchGames(name: name)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.games.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    
    func goToDetailView(navigationContoller: UINavigationController?, idGame: Int ) {
        navigationContoller?.pushViewController(router.makeDetailView(idGame: idGame ), animated: true)
    }
}
