//
//  WeatherCoreManager.swift
//  WeatherApp
//
//  Created by rentamac on 1/27/26.
//

import CoreData

final class WeatherCoreManager {

    private let context = CoreDataManager.shared.context

    func fetchWeather(for city: String) -> CoreData? {
        let request = NSFetchRequest<CoreData>(entityName: "CoreData")
        request.predicate = NSPredicate(format: "cityName == %@", city)
        return try? context.fetch(request).first
    }

    func isCacheValid(_ cached: CoreData) -> Bool {
        guard let lastUpdated = cached.lastUpdated else { return false }
        let oneHourAgo = Date().addingTimeInterval(-3600)
        return lastUpdated > oneHourAgo
    }

    func saveWeather(
        city: Location,
        response: WeatherResponse,
        weatherType: String
    ) {

        let cached = fetchWeather(for: city.name) ?? CoreData(context: context)

        cached.cityName = city.name
        cached.latitude = city.latitude
        cached.longitude = city.longitude
        cached.currentTemp = response.current.temperature2M
        cached.windSpeed = response.current.windSpeed10M
        cached.precipitation = response.current.precipitation
        cached.maxTemp = response.daily.temperature2MMax.first ?? 0
        cached.minTemp = response.daily.temperature2MMin.first ?? 0
        cached.weatherType = weatherType
        cached.lastUpdated = Date()

        CoreDataManager.shared.save()
    }
}

