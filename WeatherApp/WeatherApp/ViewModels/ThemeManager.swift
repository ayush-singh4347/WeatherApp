//
//  ThemeManager.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import SwiftUI
import Combine
final class ThemeManager: ObservableObject {
    @Published var isDarkMode: Bool = false
}
