import SwiftUI

struct MainTabView: View {
    @StateObject var viewModel = RestaurantViewModel() // One shared instance

    var body: some View {
        TabView {
            RestaurantListView(viewModel: viewModel)
                .tabItem {
                    Label("Restaurants", systemImage: "fork.knife")
                }

            FavoritesView(viewModel: viewModel) // Uses the same instance
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }

            Text("Orders") // Placeholder
                .tabItem {
                    Label("Orders", systemImage: "cart")
                }

            Text("Profile") // Placeholder
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}


struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
