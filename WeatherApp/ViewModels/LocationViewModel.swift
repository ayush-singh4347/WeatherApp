//
//  Location.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import Foundation

class LocationViewModel {
    
    let locations: [Location] = [
        Location(
            name: "Mumbai",
            weather: .sunny,
            temperature: Temperature(min: 22, max: 32),
            description: dummyText
        ),
        Location(
            name: "New Delhi",
            weather: .foggy,
            temperature: Temperature(min: 11, max: 24),
            description: dummyText
        ),
        Location(
            name: "Chennai",
            weather: .sunny,
            temperature: Temperature(min: 24, max: 36),
            description: dummyText
        ),
        Location(
            name: "Kolkata",
            weather: .rainy,
            temperature: Temperature(min: 18, max: 28),
            description: dummyText
        ),
        Location(
            name: "Pune",
            weather: .sunny,
            temperature: Temperature(min: 22, max: 32),
            description: dummyText
            ),
        Location(
            name: "Hyderabad",
            weather: .foggy,
            temperature: Temperature(min: 12, max: 20),
            description: dummyText
        ),
        Location(
            name: "Bangalore",
            weather: .sunny,
            temperature: Temperature(min: 25, max: 35),
            description: dummyText
        ),
        Location(
            name: "Manali",
            weather: .snow,
            temperature: Temperature(min: 1, max: 5),
            description: dummyText
        )
    ]
}

let dummyText = """
A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at an evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops.
"""
