//
//  TabBarController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 08/11/21.
//

import Foundation
import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    let scene = UIApplication.shared.connectedScenes.first
    private lazy var game: UIViewController = {
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            let container = sceneDelegate.container
            let gameViewController = container.resolve(GameTableViewController.self)!
            gameViewController.tabBarItem = UITabBarItem(
                title: "GimPolitan",
                image: UIImage(systemName: "gamecontroller"),
                selectedImage: UIImage(systemName: "gamecontroller.fill"))
            return UINavigationController(rootViewController: gameViewController)
        }
        return UINavigationController()
    }()
    private lazy var favorite: UIViewController = {
        if let sceneDelegate: SceneDelegate = (scene?.delegate as? SceneDelegate) {
            let container = sceneDelegate.container
            let favoriteViewController = container.resolve(FavoriteTableViewController.self)!
            favoriteViewController.tabBarItem = UITabBarItem(
                title: "Favorite",
                image: UIImage(systemName: "heart.circle"),
                selectedImage: UIImage(systemName: "heart.circle.fill"))
            return UINavigationController(rootViewController: favoriteViewController)
        }
        return UINavigationController()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let primaryColor = UIColor(named: "PrimaryColor") ?? UIColor.darkGray
        self.delegate = self
        self.tabBar.isOpaque = false
        self.tabBar.isTranslucent = true
        self.tabBar.tintColor = primaryColor
        self.tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize.zero
        tabBar.layer.shadowRadius = 5
        self.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBar.layer.borderWidth = 0
        self.tabBar.clipsToBounds = false
        self.tabBar.backgroundColor = UIColor.white
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        let selectedAtribute = [NSAttributedString.Key.foregroundColor: primaryColor]
        let normalAtribute = [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        UITabBarItem.appearance().setTitleTextAttributes(selectedAtribute, for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes(normalAtribute, for: .normal)
        self.viewControllers = [game, favorite]
    }
}
