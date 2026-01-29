//
//  LocationListViewModel.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation
import Combine

@MainActor
final class LocationListViewModel:ObservableObject {
    @Published var cachedWeather: [String:CoreData] = [:]

    let locations: [Location] = [
        Location(name: "Mumbai", latitude: 19.0760, longitude: 72.8777),
        Location(name: "New Delhi", latitude: 28.6139, longitude: 77.2090),
        Location(name: "Chennai", latitude: 13.0827, longitude: 80.2707),
        Location(name: "Kolkata", latitude: 22.5726, longitude: 88.3639),
        Location(name: "Pune", latitude: 18.5204, longitude: 73.8567),
        Location(name: "Hyderabad", latitude: 17.3850, longitude: 78.4867),
        Location(name: "Bengaluru", latitude: 12.9716, longitude: 77.5946),
        Location(name: "Manali", latitude: 32.2396, longitude: 77.1887)
    ]
    private let cache = WeatherCoreManager()

    func loadCachedWeather() {
        cachedWeather.removeAll()
        
        for location in locations {
            if let cached = WeatherCoreManager().fetchWeather(for: location.name) {
                cachedWeather[location.name] = cached
            }
        }
    }
    func clearAllCache() {
        cache.deleteAllCache()
        cachedWeather.removeAll()
        loadCachedWeather() // Refresh UI
    }
}
