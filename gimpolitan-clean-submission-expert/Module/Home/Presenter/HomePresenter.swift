//
//  HomePresenter.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import RxSwift

class HomePresenter {
    private let disposeBag = DisposeBag()
    private let router = HomeRouter()
    private let homeUseCase: HomeUseCase
    var games = PublishSubject<[GameModel]>()
    var errorMessage = PublishSubject<String>()
    var loadingState = PublishSubject<Bool>()
    init(homeUseCase: HomeUseCase) {
        self.homeUseCase = homeUseCase
    }
    func getGames(query: String? = nil) {
        loadingState.onNext(true)
        homeUseCase.getGames(query: query)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.games.onNext(result)
            } onError: { error in
                self.errorMessage.onNext(error.localizedDescription)
            } onCompleted: {
                self.loadingState.onNext(false)
            }.disposed(by: disposeBag)
    }
    func goToDetailView(navigationContoller: UINavigationController?, idGame: Int) {
        navigationContoller?.pushViewController(router.makeDetailView(idGame: idGame ), animated: true)
    }
}
