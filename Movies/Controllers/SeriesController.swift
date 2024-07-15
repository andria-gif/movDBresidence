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
    @IBOutlet weak var emptyStateView: UIView!
    let searchController = UISearchController(searchResultsController: nil)
    var series: [Series] = [Series(id: "The Walking Dead", title: "The Walking Dead", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: "", image: UIImage(named: "TheWalkingDead")), Series(id: "Greys Anatomy", title: "Greys Anatomy", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: "", image: UIImage(named: "greys"))
                            ,Series(id: "Peaky Blinders", title: "Peaky Blinders", released: "1/2/3", language: "alguma ai",genre: "batata", country: " ", posterURL: "", plot: "", image: UIImage(named: "PeakyBlinders"))
                            ,Series(id: "Caverna do Dragão", title: "Caverna do Dragão", released: "1/2/3", language: "alguma ai", genre: "batata", country: " ", posterURL: "", plot: "", image: UIImage(named: "Cave")), Series(id: "The Witcher", title: "The Witcher", released: "1/2/3", language: "alguma ai", genre: "batata", country: " ", posterURL: "", plot: "", image: UIImage(named: "TheWitcher")),
                            
    ]
    var filteredSeries: [Series] = []
    private let itemsPerRow = 2.0
    private let spaceBetweenItems = 16.0
    private let itemAspectRatio = 1.5
    private let marginSize = 16.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        setupView()
        
       
        
    }
    
    
    
    @IBAction func didTapFilterButton(_ sender: UIButton) {
        sortSeriesByTitle(&series)
        
    }
    
    
    func setupView(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Procurar por séries"
        navigationItem.searchController = searchController
    }

    private func setupCollectionView() {
        let nib = UINib(nibName: "SerieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: MovieCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailSeries" {
            guard let destination = segue.destination as? SeriesDetailViewController,
                let series = sender as? Series
            else {
                return
            }
            destination.series = series
        }
    }


    //sort
    func sortSeriesByTitle(_ series: inout [Series])  {
       series = series.sorted { $0.title < $1.title }
        collectionView.reloadData()
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
        cell.image.image = serie.image

        cell.layer.cornerRadius = 16
         
        return cell
    }
}

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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailSeries", sender: series[indexPath.row])
    }
}

extension SeriesController: UISearchResultsUpdating {
    func updateSearchResults(for searchController : UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        emptyStateView.isHidden = true
        collectionView.isHidden = false
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
                    collectionView.isHidden = true
                }
            }
        }
        collectionView.reloadData()
    }
}	

