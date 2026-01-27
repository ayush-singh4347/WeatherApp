//
//  LocationDetailView.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//


//import SwiftUI
//
//struct LocationDetailView: View {
//
//    let location: Location
//
//    var body: some View {
//        VStack(spacing: 20) {
//
//            Text(location.name)
//                .font(.largeTitle)
//                .bold()
//
//            Image(systemName: location.weather.icon)
//                .resizable()
//                .frame(width: 120, height: 120)
//               .foregroundColor(.yellow)
//
//            Text(location.temperature.temperatureText)
//                .font(.title2)
//
//            Text(location.description)
//                .foregroundColor(.black.opacity(0.7))
//                .padding()
//
//            Spacer()
//        }
//        .padding()
//        .navigationTitle("Weather")
//    }
//}

import SwiftUI

struct LocationDetailView: View {

    let location: Location
    @StateObject private var viewModel = LocationDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                Text(location.name)
                    .font(.largeTitle)
                    .bold()

                if viewModel.isLoading {
                    ProgressView()
                } else {
                    Text(viewModel.temperature)
                        .font(.system(size: 40))
                        .bold()
                }

                LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 16) {
                    InfoBox(title: "Max Temp", value: viewModel.maxTemp, icon: "thermometer.sun")
                    InfoBox(title: "Min Temp", value: viewModel.minTemp, icon: "thermometer.snowflake")
                    InfoBox(title: "Wind", value: viewModel.windSpeed, icon: "wind")
                    InfoBox(title: "Rain", value: viewModel.precipitation, icon: "cloud.rain")
                }
            }
            .padding()
        }
        .task {
            await viewModel.fetchWeather(for: location)
        }
    }
}

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

            Text(value)
                .bold()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(12)
    }
}
