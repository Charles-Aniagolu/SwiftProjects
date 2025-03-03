import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                RestaurantListView()
            }
            .tabItem {
                Label("Restaurants", systemImage: "list.dash")
            }

            NavigationView {
                FavoriteView()
            }
            .tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }

            NavigationView {
                OrderView()
            }
            .tabItem {
                Label("Orders", systemImage: "cart.fill")
            }

            NavigationView {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(RestaurantViewModel())
    }
}
