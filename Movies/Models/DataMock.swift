//
//  DadosMockados.swift
//  Movies
//
//  Created by ios-manha-10 on 24/04/24.
//

import Foundation

struct DataMock {
        
    var series: [Serie] = []
    
    mutating func insertMock() {
        let serie1: Serie = Serie(id: "1", title: "Greys Anatomy", genre: "Drama", country: "USA", language: "english", released: "2005", posterURL: "", plot: "quase todo mundo morre")
       let  serie2: Serie = Serie(id: "2", title: "The Walking Dead", genre: "Horror", country: "USA", language: "english", released: "2010", posterURL: "", plot: "quase todo mundo morre")
        
        //series.append(serie1)
        //series.append(serie2)
        series.append(serie1)
        series.append(serie2)
    }
}

