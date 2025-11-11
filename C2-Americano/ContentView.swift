import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    var body: some View {
 ZStack {
     
   Color.netflixDark.ignoresSafeArea()
    
     
     VStack(spacing: 20){
         
         Group {
             switch selectedTab {
             case 0 : HomeView()
             case 1 : NewAndHotView()
             case 2 : MyNetflixView()
             default : HomeView()
                 
             }
         }
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         
         CustomTabBarView(selectedTab: $selectedTab)
        
     }
      }
    }
}

#Preview {
    ContentView()
}
