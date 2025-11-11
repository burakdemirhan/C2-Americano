//
//  NewAndHotView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import SwiftUI

struct NewAndHotView: View {
    
    @StateObject private var viewModel = NewAndHotViewModel()
    
    var body: some View {
        
        
        HStack(spacing:30){
            
            VStack {
                HomeNavigationBar(userName: "Burak")
                CategoryTabsView()
                ScrollView{
                    VStack(spacing:40){
                        
                        ForEach(viewModel.items){ item in
                            NewAndHotCardView(item: item)
                        }
                        
                    }
                }
                .background(Color.netflixDark.ignoresSafeArea())
            }
            .task {
                await viewModel.load()
            }
        }
    }
}

#Preview {
    NewAndHotView()
}
