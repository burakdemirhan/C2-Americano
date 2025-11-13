//
//  HomeViewModel.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 12/11/25.
//

import Foundation
import Combine
@MainActor
class HomeViewModel: ObservableObject {
    @Published var items: [HotItem] = []
    
    func load(category: String) async {
        do {
            if category == "Movies" {
                items = try await APIManager.shared.fetchPopularMovies()
            } else if category == "Series" {
                items = try await APIManager.shared.fetchPopularSeries()
            } else {
                items = [] // ileride Categories için özel data koyarız
            }
        } catch {
            print("API Error:", error)
        }
    }
}
