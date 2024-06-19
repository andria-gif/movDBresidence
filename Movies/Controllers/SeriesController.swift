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
    
    var dataMock = DataMock()
    
    private var numberOfItemsInRow = 3
    private var minimumSpacing = 5
    private var edgeInsetPadding = 10
    
    override func viewDidLoad(){
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        dataMock.insertMock()
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
        cell.title.text = serie.title
        cell.layer.cornerRadius = 16
         
        return cell
    }
}


extension SeriesController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)
        edgeInsetPadding = Int(inset.left + inset.right)
        return inset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(minimumSpacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(minimumSpacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (Int(UIScreen.main.bounds.size.width) - (numberOfItemsInRow - 1) * minimumSpacing - edgeInsetPadding) / numberOfItemsInRow
        return CGSize(width: width, height: width)
    }
}
