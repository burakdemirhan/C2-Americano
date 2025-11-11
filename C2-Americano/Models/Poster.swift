//
//  Poster.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//
 import Foundation



struct Poster: Identifiable, Decodable {
    let id: Int
    let posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}
