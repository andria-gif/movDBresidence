//
//  dataMock.swift
//  Movies
//
//  Created by ios-manha-05 on 24/04/24.
//

import Foundation

struct DataMock {
        
    var series: [Series] = []
    
    mutating func insertMock() {
        let serie1: Series = Series(id: "1", title: "Greys Anatomy", released: "Drama", language: "USA", genre: "english", country: "2005", posterURL: "", plot: "quase todo mundo morre")
        let  serie2: Series = Series(id: "2", title: "The Walking Dead", released: "Horror", language: "USA", genre: "english", country: "2010", posterURL: "", plot: "quase todo mundo morre")
        
        //series.append(serie1)
        //series.append(serie2)
        series.append(serie1)
        series.append(serie2)
    }
}
