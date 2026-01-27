//
//  WeatherService.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation

final class WeatherService {

    private let network: Networking = HttpNetworking()

    func fetchWeather(
        latitude: Double,
        longitude: Double
    ) async throws -> WeatherResponse {

        let endpoint = WeatherEndpoint(
            latitude: latitude,
            longitude: longitude
        )

        return try await network.request(
            endpoint: endpoint,
            responseType: WeatherResponse.self
        )
    }
}
