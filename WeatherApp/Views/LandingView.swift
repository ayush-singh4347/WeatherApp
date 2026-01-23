//
//  Landingview.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {

                Image(systemName: "umbrella.fill")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.blue)

                Text("Breeze")
                    .foregroundColor(.blue)
                    .font(.largeTitle)
                    .bold()

                Text("Weather App")
                    .foregroundColor(.gray)
                    .bold()

                NavigationLink {
                    LocationListView()
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.9))
        }
    }
}

