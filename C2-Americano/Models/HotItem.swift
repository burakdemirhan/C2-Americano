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
    let title: String?
    let name: String?     
    let overview: String?
    let poster_path: String?

    
    var displayTitle: String {
        title ?? name ?? "Unknown Title"
    }

    var posterURL: URL? {
        guard let path = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
