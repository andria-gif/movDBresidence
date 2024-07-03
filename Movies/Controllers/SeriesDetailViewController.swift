//
//  SeriesDetailViewController.swift
//  Movies
//
//  Created by ios-manha-05 on 01/07/24.
//

import UIKit

class SeriesDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    var series: Series?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = series?.title
        plotLabel.text = series?.genre
        releasedLabel.text = series?.genre
        languageLabel.text = series?.genre
        countryLabel.text = series?.genre
        genreLabel.text = series?.genre
    }
}
