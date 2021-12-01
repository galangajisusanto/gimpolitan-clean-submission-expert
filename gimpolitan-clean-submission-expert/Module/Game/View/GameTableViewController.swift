//
//  GameTableViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 08/11/21.
//

import UIKit
import RealmSwift
import RxSwift
import Core
import Game

class GameTableViewController: UITableViewController {
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: GetListPresenter < String,
                                      GameModel,
                                      Interactor < String, [GameModel], GetGamesRepository < GetGamesRemoteDataSource, GameTransformer >>>?
    var timer: Timer?
    var disposeBag = DisposeBag()
    private var infoButton: UIBarButtonItem = {
        let image = UIImage(systemName: "info.circle")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(infoButtonClicked) )
        button.tintColor = UIColor(named: "PrimaryColor")
        return button
    }()
    var games = [GameModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToNavigationView()
        bindToTableView()
        bindSubcriber()
        fetchGames()
        
    }
    private func bindToNavigationView() {
        let image = UIImage(systemName: "info.circle")
        let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(infoButtonClicked) )
        button.tintColor = UIColor(named: "PrimaryColor")
        title = "gimpolitan".localized()
        navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController.searchBar.delegate = self
        self.navigationItem.rightBarButtonItem  = button
        self.navigationItem.searchController = searchController
    }
    @objc func infoButtonClicked() {
        let profileVC = ProfileViewController()
        self.present(profileVC, animated: true, completion: nil)
    }
    func bindToTableView() {
        let uiNib = UINib(nibName: "\(GameTableViewCell.self)", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: GameTableViewCell.identifier)
    }
    
    private func fetchGames(name: String? = nil) {
        presenter?.getList(request: name)
    }
    
    private func bindSubcriber() {
        presenter?.list.subscribe(
            onNext: { games in
                self.games = games
                print(games)
                self.tableView.reloadData()
            }
        ).disposed(by: disposeBag)
        presenter?.loadingState.subscribe(
            onNext: { status in
                if status {
                    self.showLoadingDialog()
                } else {
                    self.dismissLoadingDialog()
                }
            }).disposed(by: disposeBag)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.games.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(116)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let game = self.games[indexPath.row]
        let reuseCell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.identifier, for: indexPath)
        if let cell = reuseCell as? GameTableViewCell {
            cell.game = game
            return cell
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = GameRouter.makeDetailView(idGame: games[indexPath.row].id)
        
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}

extension GameTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchController.searchBar.text {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                if text.isEmpty {
                    self.fetchGames()
                } else {
                    self.fetchGames(name: text)
                }
                
            })
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.fetchGames()
    }
}
