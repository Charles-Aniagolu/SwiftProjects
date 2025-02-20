import SwiftUI

struct MainTabView: View {
    @StateObject private var restaurantViewModel = RestaurantViewModel()

    var body: some View {
        TabView {
            RestaurantListView()
                .environmentObject(restaurantViewModel) // Inject ViewModel
                .tabItem {
                    Label("Restaurants", systemImage: "fork.knife")
                }
            
            Text("Favorites") // Placeholder for Favorites View
                .tabItem {
                    Label("Favorites", systemImage: "heart.fill")
                }
            
            Text("Orders") // Placeholder for Orders View
                .tabItem {
                    Label("Orders", systemImage: "cart")
                }

            Text("Profile") // Placeholder for Profile View
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
