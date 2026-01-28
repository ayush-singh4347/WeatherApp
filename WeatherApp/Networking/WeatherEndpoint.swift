//
//  WeatherEndpoint.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import Foundation

struct WeatherEndpoint: APIEndpoint {

    let latitude: Double
    let longitude: Double

    var baseURL: String { "https://api.open-meteo.com" }

    var path: String { "/v1/forecast" }

    var queryItems: [URLQueryItem] {
        [
            URLQueryItem(name: "latitude", value: "\(latitude)"),
            URLQueryItem(name: "longitude", value: "\(longitude)"),
            URLQueryItem(name: "current", value: "temperature_2m,wind_speed_10m,precipitation,weathercode"),
            URLQueryItem(name: "daily", value: "temperature_2m_max,temperature_2m_min"),
            URLQueryItem(name: "timezone", value: "auto")
        ]
    }
}

