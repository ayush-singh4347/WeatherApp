//
//  LocationDetailView.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//


import SwiftUI

struct LocationDetailView: View {

    let location: Location

    var body: some View {
        VStack(spacing: 20) {

            Text(location.name)
                .font(.largeTitle)
                .bold()

            Image(systemName: location.weather.icon)
                .resizable()
                .frame(width: 120, height: 120)
               .foregroundColor(.yellow)

            Text(location.temperature.temperatureText)
                .font(.title2)

            Text(location.description)
                .foregroundColor(.black.opacity(0.7))
                .padding()

            Spacer()
        }
        .padding()
        .navigationTitle("Weather")
    }
}
