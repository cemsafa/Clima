//
//  WeatherModel.swift
//  Clima
//
//  Created by Cem Safa on 9.07.2020.
//  Copyright © 2020 Cem Safa. All rights reserved.
//

import Foundation

struct WeatherModel {
    let icon: String
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch icon {
        case "01d":
            return "sun.max"
        case "01n":
            return "moon.stars"
        case "02d":
            return "cloud.sun"
        case "02n":
            return "cloud.moon"
        case "03d", "03n":
            return "cloud"
        case "04d", "04n":
            return "smoke"
        case "09d", "09n":
            return "cloud.heavyrain"
        case "10d", "10n":
            return "cloud.rain"
        case "11d", "11n":
            return "cloud.bolt"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "cloud.fog"
        default:
            return "cloud"
        }
    }
}
