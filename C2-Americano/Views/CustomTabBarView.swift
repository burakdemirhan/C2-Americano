//
//  CustomTabBarView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import SwiftUI

struct CustomTabBarView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            tabButton(index: 0, icon: "house.fill", title: "Home")
            Spacer()
            tabButton(index: 1, icon: "flame.fill", title: "New & Hot")
            Spacer()
            tabButton(index: 2, icon: "person.fill", title: "My Netflix")
        }
        .padding(.horizontal, 30)
        .padding(.top, 10)
        .padding(.bottom, 20)
        .background(Color.netflixDark)
    }
    
    
    @ViewBuilder
    func tabButton(index: Int, icon: String, title: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .bold))   
                .foregroundStyle(selectedTab == index ? .white : .gray)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(selectedTab == index ? .white : .gray)
        }
        .onTapGesture {
            selectedTab = index
        }
    }
}
