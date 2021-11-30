//
//  GameTableViewCell.swift
//  gimpolitan-clean-submission-expert
//
//  Created by Galang Aji Susanto on 08/11/21.
//

import UIKit
import SDWebImage
import Game

class GameTableViewCell: UITableViewCell {
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var dateReleaseLabel: UILabel!
    static let identifier = "GameCellIdentifier"

    var game: GameModel? {
        didSet {
            let rateText = " \(game?.rating ?? 0) (\(Int.init(game?.ratingsCount ?? 0)))"
            let imageUrl =  URL(string: game?.backgroundImage ?? "")
            nameLabel.text = game?.name
            rateLabel.addLeading(image: UIImage(systemName: "star.fill") ?? UIImage(), text: rateText)
            dateReleaseLabel.text = game?.dateText
            posterImage.sd_setImage(with: imageUrl, placeholderImage: UIImage(systemName: "photo"))
            posterImage.setupCorners(cornerRadius: .small)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
