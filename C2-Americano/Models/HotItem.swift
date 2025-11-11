//
//  HotItem.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 06/11/25.
//

import Foundation
import SwiftUI

struct HotItem: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
