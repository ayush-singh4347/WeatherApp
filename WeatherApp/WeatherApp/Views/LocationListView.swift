import SwiftUI

struct LocationListView: View {
    @StateObject private var viewModel = LocationListViewModel()
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss

    var filteredLocations: [Location] {
        searchText.isEmpty
        ? viewModel.locations
        : viewModel.locations.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }

    var body: some View {
        VStack(spacing: 0) {
            // Search Bar
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField("Search city", text: $searchText)
            }
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(14)
            .padding()

            ScrollView {
                VStack(spacing: 0) {
                    ForEach(filteredLocations) { location in
                        LocationRow(location: location, cached: viewModel.cachedWeather[location.name])
                        Divider().padding(.horizontal)
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(20)
                .padding(.horizontal)
                
                // Delete Cache Button
                Button(action: { viewModel.clearAllCache() }) {
                    HStack {
                        Image(systemName: "trash.fill")
                        Text("Clear Weather Cache")
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.red)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(12)
                    .padding()
                }
            }
        }
        .navigationTitle("Locations")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CircleButton(icon: "chevron.left") { dismiss() }
            }
        }
        .onAppear { viewModel.loadCachedWeather() }
    }
}

// Subview for the List Row to help compiler performance
struct LocationRow: View {
    let location: Location
    let cached: CoreData?

    var body: some View {
        NavigationLink(destination: LocationDetailView(location: location)) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(location.name)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Text(cached != nil ? "\(Int(cached!.currentTemp)) °C" : "--")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Image(systemName: iconName)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(iconColor)
                    .font(.title2)
                
                Image(systemName: "chevron.right")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.leading, 5)
            }
            .padding()
        }
    }

    private var iconName: String {
        switch cached?.weatherType {
        case "rainy": return "cloud.rain.fill"
        case "windy": return "wind"
        case "foggy": return "cloud.fog.fill"
        case "cloudy": return "cloud.fill"
        case "snow": return "snowflake"
        case "storm": return "cloud.bolt.rain.fill"
        case "sunny": return "sun.max.fill"
        default: return "sun.max.fill"
        }
    }
    // Helper to ensure visibility in light mode
        private var iconColor: Color {
            switch cached?.weatherType {
            case "sunny": return .yellow
            case "cloudy": return .gray // Cloudy is now gray instead of white
            case "rainy", "storm": return .blue
            case "snow": return .cyan
            default: return .orange
            }
        }
}
