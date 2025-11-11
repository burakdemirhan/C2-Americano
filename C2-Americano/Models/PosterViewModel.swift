//
//  PosterViewModel.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 10/11/25.
//

import Foundation
import SwiftUI
import Combine


@MainActor
class PosterViewModel: ObservableObject {
    @Published var items: [Poster] = []

    func load() async {
        do {
            items = try await APIManager.shared.fetchPosterView()
        } catch {
            print("Poster API ERROR:", error)
        }
    }
}
