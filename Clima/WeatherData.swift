//
//  WeatherData.swift
//  Clima
//
//  Created by Cem Safa on 9.07.2020.
//  Copyright © 2020 Cem Safa. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
