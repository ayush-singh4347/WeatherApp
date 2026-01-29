//
//  Location.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//
//
//import Foundation
//
//class LocationViewModel {
//    
//    let locations: [Location] = [
//        Location(
//            name: "Mumbai",
//            weather: .sunny,
//            temperature: Temperature(min: 22, max: 32),
//            description: dummyText
//        ),
//        Location(
//            name: "New Delhi",
//            weather: .foggy,
//            temperature: Temperature(min: 11, max: 24),
//            description: dummyText
//        ),
//        Location(
//            name: "Chennai",
//            weather: .sunny,
//            temperature: Temperature(min: 24, max: 36),
//            description: dummyText
//        ),
//        Location(
//            name: "Kolkata",
//            weather: .rainy,
//            temperature: Temperature(min: 18, max: 28),
//            description: dummyText
//        ),
//        Location(
//            name: "Pune",
//            weather: .sunny,
//            temperature: Temperature(min: 22, max: 32),
//            description: dummyText
//            ),
//        Location(
//            name: "Hyderabad",
//            weather: .foggy,
//            temperature: Temperature(min: 12, max: 20),
//            description: dummyText
//        ),
//        Location(
//            name: "Bangalore",
//            weather: .sunny,
//            temperature: Temperature(min: 25, max: 35),
//            description: dummyText
//        ),
//        Location(
//            name: "Manali",
//            weather: .snow,
//            temperature: Temperature(min: 1, max: 5),
//            description: dummyText
//        )
//    ]
//}
//
//let dummyText = """
//A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at an evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops.
//"""


import Foundation
import Combine


@MainActor
final class LocationDetailViewModel: ObservableObject {

    @Published var temperature = "--"
    @Published var maxTemp = "--"
    @Published var minTemp = "--"
    @Published var windSpeed = "--"
    @Published var precipitation = "--"
    @Published var weatherIcon = "sun.max"
    @Published var isLoading = false

    private let service = WeatherService()

    func fetchWeather(for location: Location) async {
        isLoading = true

        do {
            let cached = try await service.fetchWeather(for: location)

            temperature = "\(cached.currentTemp) °C"
            maxTemp = "\(cached.maxTemp) °C"
            minTemp = "\(cached.minTemp) °C"
            windSpeed = "\(cached.windSpeed) km/h"
            precipitation = "\(cached.precipitation) mm"
            weatherIcon = icon(from: cached.weatherType ?? "sunny")
        } catch {
            temperature = "Error"
        }

        isLoading = false
    }

    private func icon(from type: String) -> String {
        switch type {
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
}

