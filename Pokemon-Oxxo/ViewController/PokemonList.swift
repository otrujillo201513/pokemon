//
//  PokemonList.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit
import SwiftyProgressHud

class PokemonList: UITableViewController, WebServicesDelegate {
    
    var resultPokemon = [PokeResults]()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated:true)
        title = "POKEMON"
        let requestGetList = WebServices(delegate: self)
        requestGetList.getListPokemon()
        setupElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupElements() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let nib = UINib.init(nibName: "PokemonCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PokemonCell")
        tableView.isUserInteractionEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.layer.cornerRadius = 0
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = true
        tableView.separatorStyle = .none
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Favorites", style: .done, target: self, action: #selector(goFavorites))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultPokemon.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PokemonCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokemonCell else {
            fatalError("Unexpected indexPath")
        }
        let pokemon = resultPokemon[indexPath.row]
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.lbNamePokemon.text = pokemon.name.uppercased()
        cell.lbNamePokemon.textColor = .white
        cell.lbNamePokemon.font = UIFont(name: "Copperplate", size: 24.0)
        cell.loadImageFor(indexPath: indexPath)
        cell.viewBackground.backgroundColor = UIColor.getRandomColor()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPokemon = PokemonDetail()
        detailPokemon.lbTitleHeader = self.resultPokemon[indexPath.row].name
        let selectedImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(indexPath.row + 1).png"
        detailPokemon.imgPokHeader = selectedImage
        self.present(detailPokemon, animated: true, completion: nil)
    }
    
    @objc func goFavorites() {
        navigationController?.pushViewController(FavoritePokemon(), animated: true)
    }
    
    func didFinishWithPokemon(pokemon: PokemonModel) {}
    
    func didLoadWith(data: [PokeResults]) {
        if data.count > 0 {
            resultPokemon = data
            tableView.reloadData()
        }
    }
    
    func didLoadWith(error: String) {
        print(error)
    }
}
