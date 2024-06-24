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
    var series: [Series] = [Series(id: "The Walking Dead", title: "The Walking Dead", released: "1/2/3", language: "alguma ai"), Series(id: "Greys Anatomy", title: "Greys Anatomy", released: "1/2/3", language: "alguma ai")
,Series(id: "Peaky Blinders", title: "Peaky Blinders", released: "1/2/3", language: "alguma ai")
,Series(id: "Caverna do Dragão", title: "Caverna do Dragão", released: "1/2/3", language: "alguma ai"), Series(id: "The Witcher", title: "The Witcher", released: "1/2/3", language: "alguma ai")

]
    var filteredSeries: [Series] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    func setupView(){
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Procurar por séries"
        navigationItem.searchController = searchController
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
