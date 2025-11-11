//
//  HomeBannerViewModel.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 11/11/25.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class HomeBannerViewModel : ObservableObject{
    @Published var item:HotItem? = nil
    
    
    func load() async {
        do{
            let items = try await APIManager.shared.fetchHotAndView()
            self.item = items.randomElement()
        } catch{
            print("BANNER API ERROR:", error)
        }
    }
}
