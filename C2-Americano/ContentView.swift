import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var isAuthenticated = false   // ✅ Face ID sonucu

    var body: some View {
        ZStack {
            
            if isAuthenticated {
                
                VStack(spacing: 20) {
                    Group {
                        switch selectedTab {
                        case 0: HomeView()
                        case 1: NewAndHotView()
                        case 2: MyNetflixView()
                        default: HomeView()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    CustomTabBarView(selectedTab: $selectedTab)
                }
                .background(Color.netflixDark.ignoresSafeArea())
                
            } else {
                
                ZStack {
                    Color.netflixDark.ignoresSafeArea()
                    VStack(spacing: 16) {
                        ProgressView("Authenticating...")
                            .progressViewStyle(.circular)
                            .tint(.red)
                        Text("Use Face ID to unlock your Netflix profile")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }
                .task {
                    
                    let success = await BiometricManager.shared.authenticateWithBiometrics()
                    if success {
                        withAnimation(.easeIn(duration: 0.4)) {
                            isAuthenticated = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
