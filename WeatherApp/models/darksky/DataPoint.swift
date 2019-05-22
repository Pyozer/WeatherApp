//
//  DataPoint.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

/// Weather data for a specific location and time.
struct DataPoint: Decodable {
    let time: Date
    let summary: String?
    let icon: Icon?
    let sunriseTime: Date?
    let sunsetTime: Date?
    let moonPhase: Double?
    let nearestStormDistance: Double?
    let nearestStormBearing: Double?
    let precipitationIntensity: Double?
    let precipitationIntensityMax: Double?
    let precipitationIntensityMaxTime: Date?
    let precipitationProbability: Double?
    let precipitationType: Precipitation?
    let precipitationAccumulation: Double?
    let temperature: Double?
    let temperatureLow: Double?
    let temperatureLowTime: Date?
    let temperatureHigh: Double?
    let temperatureHighTime: Date?
    let temperatureMax: Double?
    let temperatureMaxTime: Date?
    let temperatureMin: Double?
    let temperatureMinTime: Date?
    let apparentTemperature: Double?
    let apparentTemperatureLow: Double?
    let apparentTemperatureLowTime: Date?
    let apparentTemperatureHigh: Double?
    let apparentTemperatureHighTime: Date?
    let apparentTemperatureMax: Double?
    let apparentTemperatureMaxTime: Date?
    let apparentTemperatureMin: Double?
    let apparentTemperatureMinTime: Date?
    let dewPoint: Double?
    let windGust: Double?
    let windGustTime: Date?
    let windSpeed: Double?
    let windBearing: Double?
    let cloudCover: Double?
    let humidity: Double?
    let pressure: Double?
    let visibility: Double?
    let ozone: Double?
    let uvIndex: Double?
    let uvIndexTime: Date?
}
