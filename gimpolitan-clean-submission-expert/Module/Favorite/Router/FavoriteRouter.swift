//
//  FavoriteRouter.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 14/11/21.
//

import Foundation
import Core
import Game
import Favorite

class FavoriteRouter {
    static func makeDetailView (idGame: Int) -> GameDetailViewController {
        let gameDetailVC = GameDetailViewController()
        
        let gameDetailUseCase: Interactor<
            String,
            GameDetailModel,
            GetGameDetailRepository<
                GetGameDetailRemoteDataSource,
                GameDetailTransformer>
        > = Injection.init().provideGameDetail()
        
        let addFavoriteUseCase: Interactor<
            GameDetailModel,
            Bool,
            AddFavoriteRepository<
                FavoriteLocalDataSource,
                AddFavoriteTransformer>
        > = Injection.init().provideAddFavoriteGame()
        
        let deleteFavoriteUseCase: Interactor<
            String,
            Bool,
            DeleteFavoriteRepository<
                FavoriteLocalDataSource
            >
        > = Injection.init().provideDeleteFavoriteGame()
        
        let checkFavoriteUseCase: Interactor<
            String,
            Bool,
            CheckFavoriteRepository<
                FavoriteLocalDataSource
            >
        > = Injection.init().provideCheckFavoriteGame()
        
        let presenter = DetailGamePresenter(
            gameDetailUseCase: gameDetailUseCase,
            addFavoriteUseCase: addFavoriteUseCase,
            deleteFavoriteUseCase: deleteFavoriteUseCase,
            checkFavoriteUseCase: checkFavoriteUseCase
        )
        
        gameDetailVC.idGame = idGame
        gameDetailVC.presenter = presenter
        return gameDetailVC
    }
}
