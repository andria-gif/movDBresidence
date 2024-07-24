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
        guard let series = series else {
            return
        }

        self.title = series.title
        plotLabel.text = series.plot
        releasedLabel.text = series.released
        languageLabel.text = series.language
        countryLabel.text = series.country
        imageView.image = UIImage(data: series.image ?? Data())
    }
}
