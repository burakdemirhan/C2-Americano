//
//  APIManager.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 10/11/25.
//

import Foundation

class APIManager{
    static let shared = APIManager()
    private init(){}
    
    private let apiKey = "154770d5b917ae4e9e42451fc0472b01"
    
    func fetchHotAndView() async throws -> [HotItem] {
        
        let urlString =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=tr-TR&page=1"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
       
        let (data, _) = try await URLSession.shared.data(from: url)
        
       
        let decoded = try JSONDecoder().decode(HotResponse.self, from: data)
        
        return decoded.results
    }
    
    func fetchPosterView() async throws -> [Poster] {
        let urlString =
        "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=tr-TR&page=1"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(PosterResponse.self, from: data)

        return decoded.results
    }
    
}
