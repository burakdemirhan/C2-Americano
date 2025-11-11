//
//  HomeNavigationBar.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import SwiftUI

struct HomeNavigationBar: View {
    
    let userName: String
    var body: some View {
            
            HStack{
                Text(" for \(userName)").font(.title2.bold()).foregroundStyle(.white)
                
                Spacer()
                
                HStack(spacing: 16){
                    
                    Button(action:{}){
                        Image("netflix-airplay")
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                    }
                    
                    Button(action:{}){
                        Image(systemName: "arrow.down.to.line")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                    
                    Button(action:{}){
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                    
                    Button(action:{}){
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundStyle(.white)
                    }
                    
                   
                    
                    
                }
            }.padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 6)
            .background(Color.netflixDark.opacity(0.08))
    }
}


