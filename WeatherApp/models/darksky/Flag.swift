//
//  Flag.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

struct Flag: Decodable {
    let darkSkyUnavailable: Bool?
    let nearestStation: Double?
    let sources: [String]
    let units: Units
}
