import SwiftUI

struct LocationDetailView: View {
    let location: Location
    @StateObject private var viewModel = LocationDetailViewModel()
    @Environment(\.dismiss) var dismiss // To handle the back button action

    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                // 1. City Name
                Text(location.name)
                    .font(.system(size: 34, weight: .bold))
                
                // 2. Weather Icon (Now between City Name and Temperature)
                Image(systemName: viewModel.weatherIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(detailIconColor)
                    .padding(.vertical, 10)

                // 3. Temperature
                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text(viewModel.temperature)
                        .font(.system(size: 60, weight: .thin))
                }

                // 4. Detailed Grid
                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 16) {
                    InfoBox(title: "Max Temp", value: viewModel.maxTemp, icon: "thermometer.sun")
                    InfoBox(title: "Min Temp", value: viewModel.minTemp, icon: "thermometer.snowflake")
                    InfoBox(title: "Wind", value: viewModel.windSpeed, icon: "wind")
                    InfoBox(title: "Rain", value: viewModel.precipitation, icon: "cloud.rain")
                }
                .padding(.top, 20)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true) // Hide default back button
        .toolbar {
            // Custom Round Back Button
            ToolbarItem(placement: .navigationBarLeading) {
                CircleButton(icon: "chevron.left") {
                    dismiss()
                }
            }
            
            // Home Button (House in round ball)
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: LandingView().navigationBarHidden(true)) {
                    CircleButton(icon: "house.fill")
                }
            }
        }
        .task {
            await viewModel.fetchWeather(for: location)
        }
    }
    private var detailIconColor: Color {
        let icon = viewModel.weatherIcon.lowercased()
        if icon.contains("sun") { return .yellow }
        if icon.contains("rain") || icon.contains("storm") { return .blue }
        if icon.contains("cloud") { return .gray } // Forced gray for visibility
        if icon.contains("snow") { return .cyan }
        return .blue
    }
}

// MARK: - Subviews (Keep these OUTSIDE the main DetailView struct)

struct InfoBox: View {
    let title: String
    let value: String
    let icon: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(.blue)

            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)

            Text(value)
                .font(.headline)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}

struct CircleButton: View {
    let icon: String
    var action: (() -> Void)? = nil

    var body: some View {
        Group {
            if let action = action {
                Button(action: action) {
                    buttonContent
                }
            } else {
                buttonContent
            }
        }
    }

    private var buttonContent: some View {
        Image(systemName: icon)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 35, height: 35)
            .background(Color.blue)
            .clipShape(Circle())
            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}
