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
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var mainDescription: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    

    @IBOutlet weak var nextEvoImg: UIImageView!
    
    @IBOutlet weak var evoLbl: UILabel!
    
    
    override func viewDidAppear(animated: Bool) {
        nameLbl.text = pokemon.name
        mainImg.image = UIImage(named: "\(pokemon.pokedexId)")
        //mainDescription.text = pokemon.description
        //typeLbl.text = pokemon.type
        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called when download is finished.
            self.updateUI()
            
        }
    }
    
    func updateUI(){
        mainDescription.text = pokemon.description
        typeLbl.text = pokemon.type
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        idLbl.text = "\(pokemon.pokedexId)"
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        
        if pokemon.nextEvoId == "" {
            evoLbl.text = "NO EVOLUTIONS"
            nextEvoImg.hidden = true
            
        } else {
            evoLbl.text = "NEXT EVOLUTION: \(pokemon.nextEvoTxt)"
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvoId)
        }
        
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
