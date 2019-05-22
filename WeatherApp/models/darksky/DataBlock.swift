//
//  DataBlock.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

struct DataBlock: Decodable {
    let summary: String?
    let icon: Icon?
    let data: [DataPoint]
}
