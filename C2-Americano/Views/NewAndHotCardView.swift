import SwiftUI

struct NewAndHotCardView: View {
    let item: HotItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            
            
            ZStack {
                AsyncImage(url: posterURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: .black.opacity(0.4), radius: 12, x: 0, y: 8)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.05), lineWidth: 1)
                )
            }
            .padding(.horizontal)
 
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline.bold())
                    .foregroundColor(.white)
                
                
            }
            .padding(.horizontal, 20)
            
            
            
            HStack(spacing: 34) {
                
                
                Button(action: {}) {
                    VStack(spacing: 6) {
                        Image(systemName: "bell")
                            .font(.title3)
                        Text("Hatırlat")
                            .font(.caption)
                    }
                    .foregroundColor(.white)
                }
                
                
                Button(action: {}) {
                    VStack(spacing: 6) {
                        Image(systemName: "info.circle")
                            .font(.title3)
                        Text("Bilgi")
                            .font(.caption)
                    }
                    .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .padding(.top, 10)
    }
    private var posterURL: URL? {
        guard let path = item.posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}
