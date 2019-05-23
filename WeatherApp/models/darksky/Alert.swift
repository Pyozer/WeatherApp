//
//  Alert.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//
import Foundation

struct Alert: Decodable {
    let title: String
    let time: Date
    let expires: Date?
    let description: String
    let uri: URL
    let regions: [String]
}
