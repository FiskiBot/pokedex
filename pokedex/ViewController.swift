//
//  ViewController.swift
//  pokedex
//
//  Created by Patrick Moening on 4/9/16.
//  Copyright © 2016 BigFiski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let CELL_WIDTH : CGFloat = 105
    let CELL_HEIGHT: CGFloat = 105
    let NUMBER_OF_CELLS = 30

    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collection.delegate = self
        collection.dataSource = self
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//MARK: Collection Veiw Methods
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell{
            
            var testPokemon = Pokemon(name: "TESTWAD", pokedexId: indexPath.row)
            
            cell.configureCell(testPokemon)
            return cell
        } else {
            print("Your data did not make it into the view fuckface!")
            return UICollectionViewCell()
           
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NUMBER_OF_CELLS
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CELL_WIDTH, CELL_HEIGHT)
    }
}

