//
//  SerieController.swift
//  Movies
//
//  Created by ios-manha-05 on 29/04/24.
//

import Foundation
import UIKit

class SeriesController: UIViewController {
        
    @IBOutlet weak var emptyStateView: UIView!
    let searchController = UISearchController(searchResultsController: nil)
    var series: [Series] = [Series(id: "The Walking Dead", title: "The Walking Dead", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: ""), Series(id: "Greys Anatomy", title: "Greys Anatomy", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: "")
,Series(id: "Peaky Blinders", title: "Peaky Blinders", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: "")
                                                                                                                                                                                               ,Series(id: "Caverna do Dragão", title: "Caverna do Dragão", released: "1/2/3", language: "alguma ai", genre: "batata", country: " ", posterURL: "", plot: ""), Series(id: "The Witcher", title: "The Witcher", released: "1/2/3", language: "alguma ai", genre: "batata", country: " ", posterURL: "", plot: ""),

]
    var filteredSeries: [Series] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
    }
    func setupView(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Procurar por séries"
        navigationItem.searchController = searchController
    }
    //outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
 
    
    
    // Collection item parameters
        private let itemsPerRow = 2.0
        private let spaceBetweenItems = 16.0
        private let itemAspectRatio = 1.5
        private let marginSize = 16.0
    
    
    
  
    
    
    private func setupCollectionView() {
        let nib = UINib(nibName: "SerieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    

    
    
}



extension SeriesController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return series.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultSerieCell", for: indexPath) as! SerieCollectionViewCell
        
        let serie = series[indexPath.row]
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

extension SeriesController: UISearchResultsUpdating {
    func updateSearchResults(for searchController : UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        if searchText.isEmpty{
            filteredSeries = series
        } else {
            filteredSeries = []
            for currentSeries in series{
                if currentSeries.title.lowercased().contains(searchText.lowercased()) {
                    if series.contains(where: {$0 == currentSeries}) && !filteredSeries.contains(where: {$0 == currentSeries}) {
                        filteredSeries.append(currentSeries)
                    }
                } else {
                    emptyStateView.isHidden = false
                }
            }
        }
        // recarregar os dados da collectionView
    }
}	

