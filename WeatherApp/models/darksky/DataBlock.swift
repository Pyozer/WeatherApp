//
//  DataBlock.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

/// Weather data for a specific location over a period of time.
public struct DataBlock: Decodable {
    
    /// A human-readable text summary.
    public let summary: String?
    
    /// A machine-readable summary of the weather suitable for selecting an icon for display.
    public let icon: Icon?
    
    /// `DataPoint`s ordered by time, which describe the weather conditions at the requested location over time.
    public let data: [DataPoint]
    
}
