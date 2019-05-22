//
//  Precipitation.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

enum Precipitation: String, Decodable {
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case hail = "hail"
}
