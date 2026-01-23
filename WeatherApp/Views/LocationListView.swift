import SwiftUI

struct LocationListView: View {

    let viewModel = LocationViewModel()
    @State private var searchText: String = ""

    var filteredLocations: [Location] {
        if searchText.isEmpty {
            return viewModel.locations
        } else {
            return viewModel.locations.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        List(filteredLocations) { location in
            NavigationLink {
                LocationDetailView(location: location)
            } label: {
                HStack {
                    Text(location.name)
                    Spacer()
                    Image(systemName: location.weather.icon)
                        .foregroundColor(.yellow)
                }
            }
        }
        .navigationTitle("Locations")
        .searchable(
            text: $searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search city"
        )
    }
}
