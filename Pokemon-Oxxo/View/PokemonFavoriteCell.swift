//
//  PokemonFavoriteCell.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit
import SDWebImage

class PokemonFavoriteCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIView!
    @IBOutlet weak var imageDetailPokemon: UIImageView!
    @IBOutlet weak var lbDetailPokemon: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.backgroundColor = UIColor.getRandomColor()
        backgroundImage.layer.cornerRadius = backgroundImage.frame.size.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadImageFor(urlString: String) {
        imageDetailPokemon.backgroundColor = .clear
        guard let _url = URL(string: urlString) else { print("url was nil"); return }
        imageDetailPokemon.sd_setImage(with: _url, placeholderImage: UIImage(named: "LaunchScreen"), options: .refreshCached, context: nil)
        imageDetailPokemon.contentMode = .scaleAspectFit
        imageDetailPokemon.clipsToBounds = false
    }
}
