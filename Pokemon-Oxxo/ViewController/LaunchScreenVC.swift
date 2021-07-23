//
//  LaunchScreenVC.swift
//  Pokemon-Oxxo
//
//  Created by Omar Trujillo on 22/07/21.
//

import UIKit

class LaunchScreenVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    private func setupElements() {
        view.backgroundColor = .white
        let imageView = UIImageView()
        imageView.frame  = CGRect(x: 0.0, y: 0.0, width: 300.0, height: 200.0)
        imageView.center = CGPoint(x: view.center.x, y: view.center.y - 50)
        imageView.image = UIImage(named:"LaunchScreen")
        view.addSubview(imageView)
        let seconds = 3.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.navigationController?.pushViewController(PokemonList(), animated: true)
        }
    }
}
