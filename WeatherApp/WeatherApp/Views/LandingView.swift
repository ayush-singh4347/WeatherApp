//
//  Landingview.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

//import SwiftUI
//
//struct LandingView: View {
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 20) {
//
//                Image(systemName: "umbrella.fill")
//                    .resizable()
//                    .frame(width: 120, height: 120)
//                    .foregroundColor(.blue)
//
//                Text("Breeze")
//                    .foregroundColor(.blue)
//                    .font(.largeTitle)
//                    .bold()
//
//                Text("Weather App")
//                    .foregroundColor(.gray)
//                    .bold()
//
//                NavigationLink {
//                    LocationListView()
//                } label: {
//                    Image(systemName: "arrow.right.circle.fill")
//                        .font(.largeTitle)
//                        .foregroundColor(.blue)
//                }
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .background(Color.white.opacity(0.9))
//        }
//    }
//}

import SwiftUI

struct LandingView: View {

    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        NavigationStack {
            VStack {

                // Top bar
                HStack {
                    Spacer()

                    Button {
                        themeManager.isDarkMode.toggle()
                    } label: {
                        Image(systemName: themeManager.isDarkMode ? "moon.fill" : "moon")
                            .font(.title2)
                            .padding()
                    }
                }

                Spacer()

                // App Icon
                Image(systemName: "umbrella.fill")
                    .font(.system(size: 120))
                    .foregroundColor(.blue)

                Text("Breeze")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.blue)

                Text("Weather App")
                    .foregroundColor(.gray)
                    .padding(.top, 4)
                    .bold()

                // Navigation Button
                NavigationLink {
                    LocationListView()
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Circle())
                        .padding(.top, 20)
                }

                Spacer()
            }
            .padding()
        }
    }
}

