//
//  SerieController.swift
//  Movies
//
//  Created by ios-manha-05 on 29/04/24.
//

import Foundation
import UIKit

class SeriesController: UIViewController	 {
    let searchController = UISearchController(searchResultsController: nil)
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
    func updateSearchResults(for searchController: UISearchController) {
        print(searchController.searchBar.text!)
        print("Quem está me controlando " + "\(searchController.searchResultsUpdater!)")
    }
    
    
}
