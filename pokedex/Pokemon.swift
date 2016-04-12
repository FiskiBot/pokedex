//
//  Pokemon.swift
//  pokedex
//
//  Created by Patrick Moening on 4/11/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    var name: String{return _name}
    
    private var _pokedexId: Int!
    var pokedexId: Int {return _pokedexId}
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
    
    
}