//
//  WeatherManager.swift
//  Clima
//
//  Created by Cem Safa on 9.07.2020.
//  Copyright © 2020 Cem Safa. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, _ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    var weatherURL = ""
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(_ cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString)
    }
    
    func fetchWeather(_ lat: Double, _ lon: Double) {
        let urlString = "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task  = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let icon = decodedData.weather[0].icon
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(icon: icon, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
    }
    
    
}
