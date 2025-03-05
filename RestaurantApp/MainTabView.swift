import SwiftUI

struct MainTabView: View {
    @StateObject private var orderManager = OrderManager()
    @StateObject private var restaurantViewModel = RestaurantViewModel()

    var body: some View {
        TabView {
            NavigationView {
                RestaurantListView()
            }
            .tabItem {
                Label("Restaurants", systemImage: "list.dash")
            }
            .environmentObject(restaurantViewModel)
            .environmentObject(orderManager)

            NavigationView {
                FavoriteView()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            .environmentObject(restaurantViewModel)

            NavigationView {
                OrderView()
            }
            .tabItem {
                Label("Orders", systemImage: "cart.fill")
            }
            .environmentObject(orderManager)

            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
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
