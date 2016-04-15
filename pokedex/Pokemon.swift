//
//  Pokemon.swift
//  pokedex
//
//  Created by Patrick Moening on 4/11/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    var name: String {return _name}
    
    private var _pokedexId: Int!
    var pokedexId: Int {return _pokedexId}
    
    private var _type: String!
    var type: String {return _type}
    
    private var _height: String!
    var height: String {return _height}
    
    private var _weight: String!
    var weight: String {return _weight}
    
    private var _attack: String!
    var attack: String {return _attack}
    
    private var _defense: String!
    var defense: String {return _defense}
    
    private var _nextEvo: String!
    var nextEvo: String {return _nextEvo}
    
    private var _pokemonURL: String!
    var pokemonURL: String{return _pokemonURL}
    
    init(name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete){
        let url = NSURL(string: _pokemonURL)!
        Alamofire.request(.GET,url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String,AnyObject> {
                if let height = dict["height"] as? String{
                    self._height = height
                }
                
                if let weight = dict["weight"] as? String{
                    self._weight  = weight
                }
                
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                print(self._weight)
                print(self._height)
                print(self._attack)
                print(self._defense)
                
                
                if let types = dict["types"] as? [Dictionary<String,String>] where types.count > 0{
                    if let name = types[0]["name"]{
                        self._type = name
                        if types.count > 1{
                            for x in 1...types.count - 1 {
                                if let name = types[x]["name"]{
                                    self._type! += "/\(name)"
                                }
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                print(self._name)
                print(self._type)
            }
        }
    }
}




