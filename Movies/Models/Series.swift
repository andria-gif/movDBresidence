//
//  series.swift
//  Movies
//
//  Created by ios-manha-05 on 24/04/24.
//

import Foundation
import UIKit

struct Series: Equatable, Decodable {
    let id: Int
    let title: String
    let released: String?
    let language: String?
    let country: String?
    let posterURL: String?
    let plot: String?
    let image: Data?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "name"
        case released = "first_air_data"
        case language = "origin_language"
        case country = "original_country"
        case posterURL = "poster_path"
        case plot = "overview"
        case image
    }
}
