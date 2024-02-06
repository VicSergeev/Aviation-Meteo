//
//  Forecast.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
//

// MARK: - Gathering data
import Foundation

struct Metar: Decodable {
    let icaoId: String
    let name: String
    let dewp: Int
    let temp: Int
    let rawOb: String
    let visib: Double
    let wspd: Int
}
