//
//   MyNetflixView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//

import SwiftUI

struct MyNetflixView: View {
    
    @StateObject private var viewModel = PosterViewModel()
    
    
    var body: some View {
        HStack{
            VStack(spacing:30){
                HomeNavigationBar(userName: "Burak")
                
                ScrollView{
                    Image("user_icon")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80 , height: 80)
                    HStack{
                        Text("Burak")
                            .foregroundStyle(.white)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.white)
                    }
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.ultraThinMaterial)
                            .frame(width: 400, height: 170)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray.opacity(0.3), lineWidth: 0.5)
                            )
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "bell.fill")
                                    .foregroundStyle(.red)
                                Text("New episodes is coming")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                            Text("Your favorite series is here right now.")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Button(action: {
                                // Buton aksiyonu buraya
                            }) {
                                Text("Start Watching")
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 10)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.ultraThinMaterial)
                            .frame(width: 400, height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(.gray.opacity(0.3), lineWidth: 0.5)
                            )
                        
                        VStack(alignment: .leading, spacing:20) {
                            HStack {
                                Image(systemName: "arrow.down.to.line")
                                    .foregroundStyle(.red)
                                Text("Downloads")
                                    .foregroundStyle(.white)
                                    .bold()
                            }
                            
                            Text("The content you download will appear here")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            
                        }
                        .padding()
                    }
                    NetflixExclusiveRow(title: "Only Netflix")
                    NetflixExclusiveRow(title: "Popular on Netflix")
                    NetflixExclusiveRow(title: "Trending Now")
                }
                
                
                
                
            }
            
        }
    }
}

#Preview {
    MyNetflixView()
}
