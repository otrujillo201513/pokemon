//
//  PokemonDetail.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 23/07/21.
//

import UIKit
import CoreData

class PokemonDetail: UIViewController, WebServicesDelegate {
    
    var resultPokemon: PokemonModel!
    var lbTitleHeader: String = ""
    var imgPokHeader: String = ""
    var viewHeader: UIView!
    var lbTitle: UILabel!
    var imgHeader: UIImageView!
    var viewFooter: UIView!
    var lbHp: UILabel!
    var sliderHp: UISlider!
    var lbDefense: UILabel!
    var sliderDefense: UISlider!
    var lbAttack: UILabel!
    var sliderAttack: UISlider!
    var lbDef: UILabel!
    var sliderDef: UISlider!
    var lbSpeed: UILabel!
    var sliderSpeed: UISlider!
    var btnFavorite: UIButton!
    
    lazy var appDelegate = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let requestGetList = WebServices(delegate: self)
        requestGetList.fetchPokemon(pokemonName: lbTitleHeader)
        self.setupElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupElements() {
        view.backgroundColor = .orange
        viewHeader = UIView()
        viewHeader.frame = CGRect(x: 20.0, y: 20.0, width: view.frame.width - 40.0, height: 190.0)
        viewHeader.backgroundColor = .blue.withAlphaComponent(0.5)
        viewHeader.layer.cornerRadius = 25.0
        
        lbTitle = UILabel()
        lbTitle.frame = CGRect(x: 40.0, y: 10.0, width: viewHeader.frame.width - 80.0, height: 44.0)
        lbTitle.text = lbTitleHeader.uppercased()
        lbTitle.textAlignment = .center
        lbTitle.textColor = .black
        lbTitle.font = UIFont(name: "Arial", size: 18)
        
        imgHeader = UIImageView()
        imgHeader.frame = CGRect(x: 90.0, y: 35.0, width: viewHeader.frame.width - 160.0, height: 130.0)
        guard let _url = URL(string: imgPokHeader) else { print("url was nil"); return }
        imgHeader.sd_setImage(with: _url, placeholderImage: UIImage(named: "LaunchScreen"), options: .refreshCached, context: nil)
        imgHeader.contentMode = .scaleAspectFill
        imgHeader.clipsToBounds = false
        
        viewFooter = UIView()
        viewFooter.frame = CGRect(x: 20.0, y: viewHeader.frame.maxY + 15, width: view.frame.width - 40.0, height: 330.0)
        viewFooter.backgroundColor = .blue.withAlphaComponent(0.5)
        viewFooter.layer.cornerRadius = 25.0
        
        lbHp = UILabel()
        lbHp.frame = CGRect(x: 25.0, y: 10, width: viewFooter.frame.width - 50.0, height: 40.0)
        lbHp.textColor = .black
        
        sliderHp = UISlider()
        sliderHp.frame = CGRect(x: 25.0, y: lbHp.frame.maxY, width: viewFooter.frame.width - 50.0, height: 20)
        sliderHp.minimumTrackTintColor = .red
        sliderHp.maximumTrackTintColor = .lightGray
        sliderHp.thumbTintColor = .clear
        sliderHp.maximumValue = 100
        sliderHp.minimumValue = 0
        
        lbDefense = UILabel()
        lbDefense.frame = CGRect(x: 25.0, y: sliderHp.frame.maxY, width: viewFooter.frame.width - 50.0, height: 40.0)
        lbDefense.textColor = .black
        
        sliderDefense = UISlider()
        sliderDefense.frame = CGRect(x: 25.0, y: lbDefense.frame.maxY, width: viewFooter.frame.width - 50.0, height: 20)
        sliderDefense.minimumTrackTintColor = .green
        sliderDefense.maximumTrackTintColor = .lightGray
        sliderDefense.thumbTintColor = .clear
        sliderDefense.maximumValue = 100
        sliderDefense.minimumValue = 0
        
        lbAttack = UILabel()
        lbAttack.frame = CGRect(x: 25.0, y: sliderDefense.frame.maxY, width: viewFooter.frame.width - 50.0, height: 40.0)
        lbAttack.textColor = .black
        
        sliderAttack = UISlider()
        sliderAttack.frame = CGRect(x: 25.0, y: lbAttack.frame.maxY, width: viewFooter.frame.width - 50.0, height: 20)
        sliderAttack.minimumTrackTintColor = .yellow
        sliderAttack.maximumTrackTintColor = .lightGray
        sliderAttack.thumbTintColor = .clear
        sliderAttack.maximumValue = 100
        sliderAttack.minimumValue = 0
        
        lbDef = UILabel()
        lbDef.frame = CGRect(x: 25.0, y: sliderAttack.frame.maxY, width: viewFooter.frame.width - 50.0, height: 40.0)
        lbDef.textColor = .black
        
        sliderDef = UISlider()
        sliderDef.frame = CGRect(x: 25.0, y: lbDef.frame.maxY, width: viewFooter.frame.width - 50.0, height: 20)
        sliderDef.minimumTrackTintColor = .blue
        sliderDef.maximumTrackTintColor = .lightGray
        sliderDef.thumbTintColor = .clear
        sliderDef.maximumValue = 100
        sliderDef.minimumValue = 0
        
        lbSpeed = UILabel()
        lbSpeed.frame = CGRect(x: 25.0, y: sliderDef.frame.maxY, width: viewFooter.frame.width - 50.0, height: 40.0)
        lbSpeed.textColor = .black
        
        sliderSpeed = UISlider()
        sliderSpeed.frame = CGRect(x: 25.0, y: lbSpeed.frame.maxY, width: viewFooter.frame.width - 50.0, height: 20)
        sliderSpeed.minimumTrackTintColor = .brown
        sliderSpeed.maximumTrackTintColor = .lightGray
        sliderSpeed.thumbTintColor = .clear
        sliderSpeed.maximumValue = 100
        sliderSpeed.minimumValue = 0
        
        btnFavorite = UIButton()
        btnFavorite.frame = CGRect(x: 20.0, y: viewFooter.frame.maxY + 20.0, width: view.frame.width - 40.0, height: 50.0)
        btnFavorite.layer.cornerRadius = 15.0
        
        if fetchPokemon(namePokemon: lbTitleHeader) {
            btnFavorite.backgroundColor = .systemTeal
            btnFavorite.setTitle("Agregar a favoritos", for: .normal)
            btnFavorite.isEnabled = true
            btnFavorite.addTarget(self, action:#selector(self.goFavorite), for: .touchUpInside)
        }else {
            btnFavorite.backgroundColor = .lightGray
            btnFavorite.setTitle("Ya existe en favoritos", for: .normal)
            btnFavorite.isEnabled = false
        }
        
        view.addSubview(viewHeader)
        viewHeader.addSubview(lbTitle)
        viewHeader.addSubview(imgHeader)
        view.addSubview(viewFooter)
        viewFooter.addSubview(lbHp)
        viewFooter.addSubview(sliderHp)
        viewFooter.addSubview(lbDefense)
        viewFooter.addSubview(sliderDefense)
        viewFooter.addSubview(lbAttack)
        viewFooter.addSubview(sliderAttack)
        viewFooter.addSubview(lbDef)
        viewFooter.addSubview(sliderDef)
        viewFooter.addSubview(lbSpeed)
        viewFooter.addSubview(sliderSpeed)
        view.addSubview(btnFavorite)
        view.addSubview(btnFavorite)
    }
    
    @objc func goFavorite() {
        savePokemon(namePokemon: lbTitleHeader, urlPokemon: imgPokHeader)
    }
    
    func fetchPokemon(namePokemon: String) -> Bool {
        let predicate = NSPredicate(format: "name = %@", namePokemon)
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Pokemon")
        fetch.predicate = predicate
        do {
            let result = try appDelegate.fetch(fetch)
            if result.count == 0 {
                return true
            } else {
                return false
            }
        } catch  {
            return false
        }
    }
    
    func savePokemon(namePokemon: String, urlPokemon: String) {
        let detailPokemon = NSEntityDescription.insertNewObject(forEntityName: "Pokemon", into: appDelegate) as? Pokemon
        detailPokemon?.setValue(namePokemon, forKey: "name")
        detailPokemon?.setValue(urlPokemon, forKey: "urlImage")
        
        do {
            try appDelegate.save()
            showAlert(mensj: (lbTitleHeader.uppercased() + " " + "se agregó a favoritos"))
            
        } catch let error as NSError {
            showAlert(mensj: error as! String)
        }
    }
    
    func updateDataInformation() {
        if resultPokemon.stats.count > 4 {
            lbHp.text = resultPokemon.stats[0].stat.name.uppercased() + ":"
            sliderHp.setValue(Float(resultPokemon.stats[0].base_stat), animated: false)
            lbDefense.text = resultPokemon.stats[1].stat.name.uppercased() + ":"
            sliderDefense.setValue(Float(resultPokemon.stats[1].base_stat), animated: false)
            lbAttack.text = resultPokemon.stats[2].stat.name.uppercased() + ":"
            sliderAttack.setValue(Float(resultPokemon.stats[2].base_stat), animated: false)
            lbDef.text = resultPokemon.stats[3].stat.name.uppercased() + ":"
            sliderDef.setValue(Float(resultPokemon.stats[3].base_stat), animated: false)
            lbSpeed.text = resultPokemon.stats[4].stat.name.uppercased() + ":"
            sliderSpeed.setValue(Float(resultPokemon.stats[4].base_stat), animated: false)
        }
    }
    
    private func showAlert(mensj: String) {
        let alert = UIAlertController(title: "POKEMON", message: mensj, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func didLoadWith(data: [PokeResults]) {}
    
    func didLoadWith(error: String) {}
    
    func didFinishWithPokemon(pokemon: PokemonModel) {
        self.resultPokemon = pokemon
        self.updateDataInformation()
    }
}
