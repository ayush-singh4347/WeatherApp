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

    @StateObject private var viewModel = LocationListViewModel()
    @State private var searchText = ""

    var filteredLocations: [Location] {
        searchText.isEmpty
        ? viewModel.locations
        : viewModel.locations.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        VStack(spacing: 12) {

            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search city", text: $searchText)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(14)
            .padding(.horizontal)

            // List
            VStack(spacing: 0) {
                ForEach(filteredLocations) { location in

                    let cached = viewModel.cachedWeather[location.name]

                    NavigationLink {
                        LocationDetailView(location: location)
                    } label: {
                        HStack {

                            VStack(alignment: .leading, spacing: 4) {
                                Text(location.name)
                                    .font(.headline)

                                Text(
                                    cached != nil
                                    ? "\(Int(cached!.currentTemp)) °C"
                                    : "--"
                                )
                                .font(.caption)
                                .foregroundColor(.secondary)
                            }

                            Spacer()

                            Image(systemName: icon(for: cached?.weatherType))
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
            .padding(.horizontal)

            Spacer()
        }
        .navigationTitle("Locations")
        .onAppear {
            viewModel.loadCachedWeather()
        }
    }

    // Weather icon mapping
    func icon(for type: String?) -> String {
        switch type {
        case "rainy":
            return "cloud.rain.fill"
        case "windy":
            return "wind"
        case "foggy":
            return "cloud.fog.fill"
        case "cloudy":
            return "cloud.fill"
        case "snow":
            return "snowflake"
        case "storm":
            return "cloud.bolt.rain.fill"
        case "sunny":
            return "sun.max.fill"
        default:
            return "sun.max"
        }
    }

    }

