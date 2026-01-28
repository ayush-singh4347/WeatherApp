import Foundation

struct WeatherResponse: Codable {
    let current: Current
    let daily: Daily
    let currentUnits: CurrentUnits
    let dailyUnits: DailyUnits

    enum CodingKeys: String, CodingKey {
        case current
        case daily
        case currentUnits = "current_units"
        case dailyUnits = "daily_units"
    }
}

struct Current: Codable {
    let temperature2M: Double
    let windSpeed10M: Double
    let precipitation: Double
    let weatherCode: Int

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
        case windSpeed10M = "wind_speed_10m"
        case precipitation
        case weatherCode = "weathercode"
    }
}

struct Daily: Codable {
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]

    enum CodingKeys: String, CodingKey {
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}

struct CurrentUnits: Codable {
    let temperature2M: String
    let windSpeed10M: String
    let precipitation: String

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
        case windSpeed10M = "wind_speed_10m"
        case precipitation
    }
}

struct DailyUnits: Codable {
    let temperature2MMax: String
    let temperature2MMin: String

    enum CodingKeys: String, CodingKey {
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
    }
}
