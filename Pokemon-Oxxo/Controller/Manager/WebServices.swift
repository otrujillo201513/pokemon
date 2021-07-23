//
//  WebServices.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import Foundation

protocol WebServicesDelegate: AnyObject {
    func didLoadWith(data: [PokeResults])
    func didLoadWith(error: String)
    func didFinishWithPokemon(pokemon: PokemonModel)
}

public class WebServices {
    
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    weak var delegate: WebServicesDelegate?
    var pokeResults = [PokeResults]()
    var rechability = Rechability()
    
    init(delegate: WebServicesDelegate) {
        self.delegate = delegate
    }
    
    func getListPokemon() {
        if rechability.isInternetAvailable() {
            let apiURL = URL(string: baseURL)!
            let task = URLSession.shared.dataTask(with: apiURL) { (data, resp, err) in
                weak var _self = self
                guard let data = data else { return }
                do {
                    let decoder = try JSONDecoder().decode(ListModel.self, from: data)
                    DispatchQueue.main.async {
                        self.pokeResults = decoder.results
                        _self?.delegate?.didLoadWith(data: self.pokeResults)
                    }
                }
                catch {
                    print(err?.localizedDescription ?? "Error Service getListPokemon")
                }
            }
            task.resume()
        } else {
            print("Sin internet para petición")
        }
    }
    
    
    func fetchPokemon (pokemonName: String) {
        if rechability.isInternetAvailable() {
            let pokemonURL = baseURL+"\(pokemonName)/"
            guard let url = URL(string: pokemonURL) else {return}
            let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
                guard let data = data else {return}
                do {
                    let decoder = try JSONDecoder().decode(PokemonModel.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.didFinishWithPokemon(pokemon: decoder)
                    }
                }
                catch{
                    print(err?.localizedDescription ?? "Error Service fetchPokemon")
                }
            }
            task.resume()
        } else {
            print("Sin internet para petición")
        }
    }
}
