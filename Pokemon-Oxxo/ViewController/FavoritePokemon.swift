//
//  FavoritePokemon.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 22/07/21.
//

import UIKit
import CoreData

class FavoritePokemon: UITableViewController {
    lazy var appDelegate = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var resultFavorite = [Pokemon]()
    
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupElements()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let fetchRequest : NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        do {
            let results = try appDelegate.fetch(fetchRequest)
            resultFavorite = results
        } catch let error as NSError {
            print("No ha sido posible cargar \(error), \(error.userInfo)")
        }
        tableView.reloadData()
    }
    
    
    private func setupElements() {
        title = "FAVORITOS"
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let nib = UINib.init(nibName: "PokemonFavoriteCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PokemonFavoriteCell")
        tableView.isUserInteractionEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 0
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.separatorStyle = .singleLine
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultFavorite.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PokemonFavoriteCell = tableView.dequeueReusableCell(withIdentifier: "PokemonFavoriteCell", for: indexPath) as? PokemonFavoriteCell else {
            fatalError("Unexpected indexPath")
        }
        let pokemon = resultFavorite[indexPath.row]
        cell.lbDetailPokemon.text = pokemon.name?.uppercased()
        cell.lbDetailPokemon.textColor = .black
        cell.lbDetailPokemon.font = UIFont(name: "Copperplate", size: 20.0)
        cell.loadImageFor(urlString: pokemon.urlImage ?? "")
        cell.isUserInteractionEnabled = false
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
