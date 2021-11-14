//
//  GameDetailViewController.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 12/11/21.
//

import UIKit
import RxSwift

class GameDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var dateReleaseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var favoriteButton: UIBarButtonItem?
    var unfavoriteButton: UIBarButtonItem?
    var gameDetail: GameDetailModel?
    var presenter: DetailPresenter?
    var idGame: Int?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindView()
        bindSubcriber()
    }
    
    private func bindView() {
        navigationController?.navigationBar.tintColor = UIColor(named: "PrimaryColor")
        favoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain,
                                         target: self, action: #selector(favoriteTapped))
        unfavoriteButton = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain,
                                           target: self, action: #selector(unfavoriteTapped))
        self.navigationItem.setRightBarButton( self.favoriteButton, animated: true)
        
    }
    
    @objc func favoriteTapped() {
        if let gameData = self.gameDetail {
            presenter?.addGame(game: gameData)
        }
    }
    @objc func unfavoriteTapped() {
        if let idGameDate = self.idGame {
            presenter?.removeGame(gameId: idGameDate)
        }
    }
    
    private func bindSubcriber() {
        presenter?.gameDetail.subscribe(
            onNext: { game in
                self.gameDetail = game
                self.updateUI(game)
            }
        ).disposed(by: disposeBag)
        presenter?.loadingState.subscribe(
            onNext: { status in
                if status {
                    self.showLoadingDialog()
                } else {
                    self.dismissLoadingDialog()
                }
            }
        ).disposed(by: disposeBag)
        presenter?.errorMessage.subscribe(
            onNext: { message in
                print("error message:\(message)")
            }).disposed(by: disposeBag)
        presenter?.addGameStatus.subscribe(
            onNext: { status in
                if status {
                    self.navigationItem.setRightBarButton( self.unfavoriteButton, animated: true)
                }
            }).disposed(by: disposeBag)
        presenter?.removeGameStatus.subscribe(
            onNext: { status in
                if status {
                    self.navigationItem.setRightBarButton( self.favoriteButton, animated: true)
                }
            }).disposed(by: disposeBag)
        presenter?.isGameFavorite.subscribe(
            onNext: { isFavorite in
                if isFavorite {
                    self.navigationItem.setRightBarButton( self.unfavoriteButton, animated: true)
                } else {
                    self.navigationItem.setRightBarButton( self.favoriteButton, animated: true)
                }
            }).disposed(by: disposeBag)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let gameId = idGame {
            presenter?.getGamesDetal(idGames: "\(gameId)")
            presenter?.checkIsFavoriteGameExist(idGame: gameId)
        }
    }
    
    private func updateUI(_ gameDetail: GameDetailModel) {
        nameLabel.text = gameDetail.name
        let rateText = " \(gameDetail.rating) (\(Int.init(gameDetail.ratingsCount)))"
        let imageUrl =  URL(string: (gameDetail.backgroundImage ?? ""))
        rateLabel.addLeading(image: UIImage(systemName: "star.fill") ?? UIImage(), text: rateText)
        dateReleaseLabel.text = gameDetail.dateText
        descriptionLabel.text = gameDetail.description
        posterImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
    }
    
}
