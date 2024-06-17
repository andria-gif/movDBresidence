//
//  SerieController.swift
//  Movies
//
//  Created by ios-manha-05 on 29/04/24.
//

import Foundation
import UIKit

class SeriesController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
       // collectionView.dataSource = self
    }
    
    
}

extension SeriesController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 //Serie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultSerieCell", for : indexPath) as! SerieCollectionViewCell
        
        cell.background.backgroundColor = UIColor.orange
       // cell.title.text = categories[indexPath.row]
        
        //cell.layer.cornerRadius = 16
       
        
         
        //return cell
        return UICollectionViewCell()
    }
    
    
}
