//import SwiftUI
//
//struct LocationListView: View {
//
//    let viewModel = LocationViewModel()
//    @State private var searchText: String = ""
//
//    var filteredLocations: [Location] {
//        if searchText.isEmpty {
//            return viewModel.locations
//        } else {
//            return viewModel.locations.filter {
//                $0.name.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//
//    var body: some View {
//        List(filteredLocations) { location in
//            NavigationLink {
//                LocationDetailView(location: location)
//            } label: {
//                HStack {
//                    Text(location.name)
//                    Spacer()
//                    Image(systemName: location.weather.icon)
//                        .foregroundColor(.yellow)
//                }
//            }
//        }
//        .navigationTitle("Locations")
//        .searchable(
//            text: $searchText,
//            placement: .navigationBarDrawer(displayMode: .always),
//            prompt: "Search city"
//        )
//    }
//}
//
//import SwiftUI
//
//struct LocationListView: View {
//    let viewModel = LocationListViewModel()
//        @State private var searchText: String = ""
//    
//        var filteredLocations: [Location] {
//            if searchText.isEmpty {
//                return viewModel.locations
//            } else {
//                return viewModel.locations.filter {
//                    $0.name.localizedCaseInsensitiveContains(searchText)
//                }
//            }
//        }
//    let locations: [Location] = [
//        Location(name: "Mumbai", latitude: 19.0760, longitude: 72.8777),
//        Location(name: "Delhi", latitude: 28.6139, longitude: 77.2090),
//        Location(name: "Chennai", latitude: 13.0827, longitude: 80.2707),
//        Location(name: "Bengaluru", latitude: 12.9716, longitude: 77.5946)
//    ]
//
//    var body: some View {
//        List(viewModel.locations) { location in
//            NavigationLink(location.name) {
//                LocationDetailView(location: location)
//            }
//        }
//        .navigationTitle("Locations")
//        .searchable(
//                    text: $searchText,
//                    placement: .navigationBarDrawer(displayMode: .always),
//                    prompt: "Search city"
//                    )
//    }
//}
import SwiftUI

struct LocationListView: View {

    let viewModel = LocationListViewModel()
    @State private var searchText = ""

    var filteredLocations: [Location] {
        searchText.isEmpty
        ? viewModel.locations
        : viewModel.locations.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack {

            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search city", text: $searchText)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)
            .padding()

            // List Card
            VStack(spacing: 0) {
                ForEach(filteredLocations) { location in
                    NavigationLink {
                        LocationDetailView(location: location)
                    } label: {
                        HStack {
                            Text(location.name)
                                .foregroundColor(.primary)

                            Spacer()

                            weatherIcon(for: location.name)
                                .foregroundColor(.yellow)

                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        .padding()
                    }

                    Divider()
                }
            }
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .padding()

            Spacer()
        }
        .navigationTitle("Locations")
    }

    // Temporary demo icons (can later be API-based)
    func weatherIcon(for city: String) -> Image {
        switch city {
        case "Manali":
            return Image(systemName: "snowflake")
        case "Kolkata":
            return Image(systemName: "cloud.rain")
        case "New Delhi", "Hyderabad":
            return Image(systemName: "cloud.fog")
        default:
            return Image(systemName: "sun.max")
        }
    }
}
