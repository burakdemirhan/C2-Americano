//
//  NewAndHotViewModel.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 10/11/25.
//

 
import Foundation
import SwiftUI
import Combine

@MainActor
class NewAndHotViewModel: ObservableObject {
    
    @Published var items: [HotItem] = []   
    
    func load() async {
        do {
            items = try await APIManager.shared.fetchHotAndView()
        } catch {
            print("API ERROR:", error)
        }
    }
}
