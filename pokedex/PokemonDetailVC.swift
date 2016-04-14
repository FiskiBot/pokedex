//
//  PokemoneDetailVC.swift
//  pokedex
//
//  Created by Patrick Moening on 4/13/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon : Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidAppear(animated: Bool) {
        nameLbl.text = pokemon.name
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
