//
//  Utils.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

class Utils {
    static func formatTemperature(_ temperature: Double) -> String {
        let unit = Settings.unitSystem == .us ? "°F" : "°C"
        return "\(temperature.toRoundString())\(unit)"
    }
    
    static func formatSpeed(_ speed: Double) -> String {
        let unit = Settings.unitSystem == .us ? "mph" : "km/h"
        return "\(speed.toRoundString()) \(unit)"
    }
}

extension Double {
    func toRoundString() -> String {
        return String(format: "%.0f", self)
    }
}

extension StringProtocol {
    var firstUppercased: String {
        return prefix(1).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        return String(prefix(1)).capitalized + dropFirst()
    }
}
