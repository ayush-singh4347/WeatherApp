//
//  WeatherService.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation

//final class WeatherService {
//
//    private let network: Networking = HttpNetworking()
//
//    func fetchWeather(
//        latitude: Double,
//        longitude: Double
//    ) async throws -> WeatherResponse {
//
//        let endpoint = WeatherEndpoint(
//            latitude: latitude,
//            longitude: longitude
//        )
//
//        return try await network.request(
//            endpoint: endpoint,
//            responseType: WeatherResponse.self
//        )
//    }
//}
final class WeatherService {

    private let network: Networking = HttpNetworking()
    private let cache = WeatherCoreManager()

    func fetchWeather(for location: Location) async throws -> CoreData {

        if let cached = cache.fetchWeather(for: location.name),
           cache.isCacheValid(cached) {
            return cached
        }

        let endpoint = WeatherEndpoint(
            latitude: location.latitude,
            longitude: location.longitude
        )

        let response = try await network.request(
            endpoint: endpoint,
            responseType: WeatherResponse.self
        )

        let weatherType = mapWeatherType(response.current.weatherCode)


        cache.saveWeather(
            city: location,
            response: response,
            weatherType: weatherType
        )

        return cache.fetchWeather(for: location.name)!
    }

    private func mapWeatherType(_ code: Int) -> String {
        switch code {
        case 0:
            return "sunny"
        case 1, 2, 3:
            return "cloudy"         
        case 45, 48:
            return "foggy"
        case 51...67:
            return "rainy"
        case 71...77:
            return "snow"
        case 80...82:
            return "rainy"
        case 95...99:
            return "storm"
        default:
            return "sunny"
        }
    }

    // Maps a weather type string to an SF Symbol name used by UI lists
    func icon(for type: String?) -> String {
        switch type {
        case "rainy":
            return "cloud.rain.fill"
        case "windy":
            return "wind"
        case "foggy":
            return "cloud.fog.fill"
        case "cloudy":
            return "cloud.fill"
        case "snow":
            return "snowflake"
        case "storm":
            return "cloud.bolt.rain.fill"
        case "sunny":
            return "sun.max.fill"
        default:
            return "questionmark.circle"
        }
    }

    }
