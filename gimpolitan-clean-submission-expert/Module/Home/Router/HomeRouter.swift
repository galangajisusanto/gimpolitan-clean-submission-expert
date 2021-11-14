//
//  HomeRouter.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 07/11/21.
//

import Foundation
import UIKit

class HomeRouter {
    let scene = UIApplication.shared.connectedScenes.first
    func makeDetailView (idGame: Int) -> GameDetailViewController {
        var gameDetailVC: GameDetailViewController?
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            gameDetailVC = sceneDelegate.container.resolve(GameDetailViewController.self)
        }
        gameDetailVC?.idGame = idGame
        return gameDetailVC ?? GameDetailViewController()
    }
}
