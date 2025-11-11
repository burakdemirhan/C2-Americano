//
//  HomeBannerView.swift
//  C2-Americano
//
//  Created by Burak Demirhan on 05/11/25.
//
import SwiftUI

struct HomeBannerView: View {
    
    let poster: String
    let title: String
    let description: String
    
    var body: some View {
           
           
        ZStack(alignment: .bottom) {
            
            
            Image(poster)
                .resizable()
                .scaledToFill()
                .blur(radius: 40)
                .opacity(0.35)
                .shadow(radius: 20)
                .clipShape(RoundedRectangle(cornerRadius: 22))
                .ignoresSafeArea()
            
            Color.yellow
                .opacity(0.45)
                .ignoresSafeArea()
  
            VStack(spacing: 16) {
                
                Image(poster)
                  .resizable()
                  .scaledToFill()
                    .frame(width: 260, height: 360)
                     .clipShape(RoundedRectangle(cornerRadius: 22))
                
               
                Text(title)
                    .font(.headline.bold())
                    .foregroundColor(.white)
                
               
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
              
                HStack(spacing: 20) {
                    
              
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "play.fill")
                            Text("Play")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal, 24)
                        .padding(.vertical, 10)
                        .background(Color.white)
                        .cornerRadius(4)
                    }
                    
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "plus")
                            Text("My List")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.3))
                        .cornerRadius(4)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .frame(height: 480)
        
    }
}


