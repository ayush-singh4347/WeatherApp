//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

@main
struct WeatherAppApp: App {

    @StateObject private var themeManager = ThemeManager()

    var body: some Scene {
        WindowGroup {
            LandingView()
                .environmentObject(themeManager)
                .preferredColorScheme(
                    themeManager.isDarkMode ? .dark : .light
                )
        }
    }
}
