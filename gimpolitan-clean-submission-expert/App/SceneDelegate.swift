//
//  SceneDelegate.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import UIKit
import Swinject
import RealmSwift

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let container: Container = {
        let container = Container()
        let realm = try? Realm()
        container.register(GameRemoteDataSource.self) {_ in
            GameRemoteDataSourceImpl()
        }
        container.register(GameLocalDataSource.self) { _ in
            GameLocaleDataSourceImpl.sharedInstance(realm)
        }
        container.register(GameRepository.self) { resolver in
            GameRepositoryImpl(
                remoteDataSource: resolver.resolve(GameRemoteDataSource.self)!,
                localDataSource: resolver.resolve(GameLocalDataSource.self)!
            )
        }
        container.register(HomeUseCase.self) { resolver in
            HomeInteractor(repository: resolver.resolve(GameRepository.self)!)
        }
        container.register(HomePresenter.self) { resolver in
            HomePresenter(homeUseCase: resolver.resolve(HomeUseCase.self)!)
        }
        container.register(GameTableViewController.self) { resolver in
            let controller = GameTableViewController()
            controller.homePresenter = resolver.resolve(HomePresenter.self)
            return controller
        }
        container.register(DetailUseCase.self) { resolver in
            DetailInteractor(repository: resolver.resolve(GameRepository.self)!)
        }
        container.register(DetailPresenter.self) { resolver in
            DetailPresenter(detailUseCase: resolver.resolve(DetailUseCase.self)!)
        }
        container.register(GameDetailViewController.self) { resolver in
            let controller = GameDetailViewController()
            controller.presenter = resolver.resolve(DetailPresenter.self)
            return controller
        }
        container.register(FavoriteUseCase.self) { resolver in
            FavoriteInteractor(repository: resolver.resolve(GameRepository.self)!)
        }
        container.register(FavoritePresenter.self) { resolver in
            FavoritePresenter(favoriteUseCase: resolver.resolve(FavoriteUseCase.self)!)
        }
        container.register(FavoriteTableViewController.self) { resolver in
            let controller = FavoriteTableViewController()
            controller.presenter = resolver.resolve(FavoritePresenter.self)
            return controller
        }
        return container
    }()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let winScreen = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScreen)
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
    }
    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
}
