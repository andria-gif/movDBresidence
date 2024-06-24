//
//  SerieController.swift
//  Movies
//
//  Created by ios-manha-05 on 29/04/24.
//

import Foundation
import UIKit

class SeriesController: UIViewController {
    
    //outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataMock = DataMock()
    
    
    // Collection item parameters
        private let itemsPerRow = 2.0
        private let spaceBetweenItems = 16.0
        private let itemAspectRatio = 1.5
        private let marginSize = 16.0
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        dataMock.insertMock()
    }
    
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "SerieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    

    
    
}



extension SeriesController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataMock.series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultSerieCell", for: indexPath) as! SerieCollectionViewCell
        
        let serie = dataMock.series[indexPath.row]
        cell.background.backgroundColor = UIColor.orange
        
        cell.layer.cornerRadius = 16
         
        return cell
    }
}

//  MARK: - UICollectionViewDelegateFlowLayout

extension SeriesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: marginSize, left: marginSize, bottom: marginSize, right: marginSize)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenItems)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(spaceBetweenItems)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        
        let collectionWidth = collectionView.frame.size.width - (2 * marginSize)
        let availableWidth = collectionWidth - (spaceBetweenItems * (itemsPerRow - 1))
        
        let itemWidth = availableWidth / itemsPerRow
        let itemHeight = itemWidth * itemAspectRatio
        
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
