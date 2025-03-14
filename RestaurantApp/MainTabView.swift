

import SwiftUI

struct MainTabView: View {
    @StateObject private var authManager = AuthManager()
    @StateObject private var orderManager = OrderManager()
    @StateObject private var restaurantViewModel = RestaurantViewModel()

    var body: some View {
        NavigationView { // ✅ Wrap the entire TabView inside NavigationView
            TabView {
                // ✅ Restaurants Tab
                RestaurantListView()
                    .tabItem {
                        Label("Restaurants", systemImage: "list.dash")
                    }
                    .environmentObject(restaurantViewModel)
                    .environmentObject(orderManager)

                // ✅ Favorites Tab
                FavoriteView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart.fill")
                    }
                    .environmentObject(restaurantViewModel)

                // ✅ Orders Tab
                OrderView()
                    .tabItem {
                        Label("Orders", systemImage: "cart.fill")
                    }
                    .environmentObject(orderManager)

                // ✅ Profile Tab
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .environmentObject(authManager)
            }
            .navigationBarTitle("Restaurants") // ✅ Ensures title is visible
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// MARK: - Preview
struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(RestaurantViewModel())
            .environmentObject(OrderManager())
    }
}
