//
//  PokeCell.swift
//  pokedex
//
//  Created by Patrick Moening on 4/11/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    
    var pokemon: Pokemon!
    
    func configureCell(pokemon: Pokemon){
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named:"\(pokemon.pokedexId)")
        
    }
    
}
