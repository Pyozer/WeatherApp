//
//  OpenCageResponse.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 24/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import Foundation

struct OpenCageResponse: Codable {
    let results: [Result]?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    let annotations: Annotations?
    let components: Components?
    let formatted: String?
    let geometry: Geometry?
}

struct Annotations: Codable {
    let flag: String?
}

struct Components: Codable {
    let city: String?
    let country: String?
}

struct Geometry: Codable {
    let lat: Double?
    let lng: Double?
}
