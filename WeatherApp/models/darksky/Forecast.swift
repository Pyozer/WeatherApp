//
//  Forecast.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

struct Forecast: Decodable {
     let latitude: Double
     let longitude: Double
     let timezone: String
     let alerts: [Alert]?
     let flags: Flag?
     let currently: DataPoint?
     let hourly: DataBlock?
     let daily: DataBlock?
}
