//
//  FavoriteTableViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 14/11/21.
//

import UIKit
import RxSwift

class FavoriteTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    var presenter: FavoritePresenter?
    var games = [GameModel]()
    var disposeBag = DisposeBag()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindToTableView()
        bindToNavigationView()
        bindSubcriber()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        fetchFavorites()
    }
    private func fetchFavorites(name: String? = nil) {
        if let searchByname = name {
            presenter?.serchGames(name: searchByname)
        } else {
            presenter?.getFavotiteGames()
        }
    }
    private func bindToNavigationView() {
        title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func bindSubcriber() {
        presenter?.games.subscribe(
            onNext: { games in
                self.games = games
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
    
    func bindToTableView() {
        let uiNib = UINib(nibName: "\(GameTableViewCell.self)", bundle: nil)
        tableView.register(uiNib, forCellReuseIdentifier: GameTableViewCell.identifier)
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
        presenter?.goToDetailView(navigationContoller: self.navigationController, idGame: games[indexPath.row].idGame)
    }
}

extension FavoriteTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchController.searchBar.text {
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (_) in
                if text.isEmpty {
                    self.fetchFavorites()
                } else {
                    self.fetchFavorites(name: text)
                }
            })
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.fetchFavorites()
    }
}
