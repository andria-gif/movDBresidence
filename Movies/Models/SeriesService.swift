//
//  SeriesService.swift
//  Movies
//
//  Created by ios-manha-05 on 22/07/24.
//

import Foundation

struct SeriesService {
    private let apiBaseURL = "https://api.themoviedb.org/3/search/tv?"
    private let apiToken = "&api_key=73b6bfb8eb9c67f69bd46b0816ab2936"
    
    private let decoder = JSONDecoder()
    
    func searchSeries(withTitle title: String, completion: @escaping ([Series]?) -> Void) {
        let query = title.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let endpoint = apiBaseURL + "query=\(query)" + apiToken
        // https://api.themoviedb.org/3/search/tv?query=Supergirl&api_key=73b6bfb8eb9c67f69bd46b0816ab2936
        
        guard let url = URL(string: endpoint) else {
            completion([])
            return
        }
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                    error == nil else {
                completion([])
                return
            }
            do {
                let seriesResponse = try decoder.decode(SeriesResponse.self, from: data)
                completion(seriesResponse.results)
            } catch{
                print(error)
                completion([])
            }
        }
        task.resume()
    }
    
    func loadImageData(fromURL link: String, completion: @escaping (Data?) -> Void) {
        let host: String = "https://image.tmdb.org/t/p/w500"
        guard let url = URL(string: host + link) else {
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(data)
        }
        
        task.resume()
    }
}
