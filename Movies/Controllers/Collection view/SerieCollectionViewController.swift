//
//  CollectionViewController.swift
//  Movies
//
//  Created by ios-manha-08 on 10/06/24.
//

import Foundation
import UIKit

class SerieCollectionViewController : UIViewController {
    

    @IBOutlet weak var collectionView: UICollectionViewCell!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collection.dataSource = self
    }
    
    
    
    
   
    
}

extension SerieCollectionViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#> //Serie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withIdentifier: "defaultSerieCell", for : indexPath) as! SerieCollectionViewCell
        
        // cell.backgroundColor = UIColor  = UIColor.orange
        // cell.titlr.text = categories[indexPath.row]
    }
    
    
}
