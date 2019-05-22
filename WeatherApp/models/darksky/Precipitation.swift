//
//  Precipitation.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

/// Types of precipitation.
public enum Precipitation: String, Decodable {
    
    /// Rainy.
    case rain = "rain"
    
    /// Snowy.
    case snow = "snow"
    
    /// Sleet, freezing rain, ice pellets, or wintery mix.
    case sleet = "sleet"
    
    /// Haily.
    case hail = "hail"
    
}
