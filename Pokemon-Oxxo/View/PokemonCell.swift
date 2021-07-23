//
//  PokemonCell.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit
import SDWebImage

internal class PokemonCell: UITableViewCell {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var lbNamePokemon: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadImageFor(indexPath: IndexPath) {
        imagePokemon.backgroundColor = .clear
        let newUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"
        guard let _url = URL(string: newUrl) else { print("url was nil"); return }
        imagePokemon.sd_setImage(with: _url, placeholderImage: UIImage(named: "LaunchScreen"), options: .refreshCached, context: nil)
        imagePokemon.contentMode = .scaleAspectFit
        imagePokemon.clipsToBounds = false
    }
}
