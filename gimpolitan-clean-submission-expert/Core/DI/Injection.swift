//
//  Injection.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 21/11/21.
//
import UIKit
import Game
import Core
import Favorite

final class Injection: NSObject {
    
    func provideGames<U: UseCase>() -> U where U.Request == String, U.Response == [GameModel] {
        
        let remote = GetGamesRemoteDataSource(endpoint: Endpoints.Gets.games.url)
        
        let mapper = GameTransformer()
        
        let repository = GetGamesRepository(
            remoteDataSource: remote,
            mapper: mapper
        )
        
        return (Interactor(repository: repository) as? U)!
    }
    
    func provideGameDetail<U: UseCase>() -> U where U.Request == String, U.Response == GameDetailModel {
                
        let remote = GetGameDetailRemoteDataSource(endpoint: Endpoints.Gets.gameDetails.url)
        
        let mapper = GameDetailTransformer()
        
        let repository = GetGameDetailRepository(
            remoteDataSource: remote,
            mapper: mapper
        )
        
        return (Interactor(repository: repository) as? U)!
    }
    
    func provideFavoriteGames<U: UseCase>() -> U where U.Request == String, U.Response == [GameModel] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let locale = FavoriteLocalDataSource(realm: appDelegate.realm)
        
        let mapper = FavoriteTransformer()
        
        let repository = GetFavoritesRepository(
            localeDataSource: locale,
            mapper: mapper
        )
        
        return (Interactor(repository: repository) as? U)!
    }
    
    func provideAddFavoriteGame<U: UseCase>() -> U where U.Request == GameDetailModel, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let locale = FavoriteLocalDataSource(realm: appDelegate.realm)
        
        let mapper = AddFavoriteTransformer()
        
        let repository = AddFavoriteRepository(localeDataSource: locale, mapper: mapper)
        
        return (Interactor(repository: repository) as? U)!
    }
    
    func provideDeleteFavoriteGame<U: UseCase>() -> U where U.Request == String, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let locale = FavoriteLocalDataSource(realm: appDelegate.realm)
                
        let repository = DeleteFavoriteRepository(localeDataSource: locale)
        
        return (Interactor(repository: repository) as? U)!
    }
    
    func provideCheckFavoriteGame<U: UseCase>() -> U where U.Request == String, U.Response == Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        let locale = FavoriteLocalDataSource(realm: appDelegate.realm)
                
        let repository = CheckFavoriteRepository(localeDataSource: locale)
        
        return (Interactor(repository: repository) as? U)!
    }
    
}
