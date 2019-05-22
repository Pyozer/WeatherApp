//
//  Utils.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

extension Double {
    func toRoundString() -> String {
        return String(format: "%.0f", self)
    }
}
