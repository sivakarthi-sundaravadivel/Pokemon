//
//  PokemonDetailViewController.swift
//  PokemonList
//
//  Created by s.sivakarthi on 22/08/2022.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var pokeyCard: PokeyTableViewCell?
    
    @IBOutlet var pokemonName: UILabel!
    @IBOutlet var pokemonSuperType: UILabel!
    @IBOutlet var pokemonPH: UILabel!
    @IBOutlet var pokemonEvolvesFrom: UILabel!
    @IBOutlet var pokemonImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonName.text = ""

    }
    
    func setupUI(withDataFrom: Card){
        pokemonName.text = withDataFrom.name
    }
    

}
