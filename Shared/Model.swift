//
//  Model.swift
//  wiseWeather
//
//  Created by Jason Wise on 2/7/22.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeatherData: Codable {
    let id: Int
    let coord: String
    let weather: String
    let temp: String
}
