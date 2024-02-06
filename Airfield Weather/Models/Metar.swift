//
//  Forecast.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
//

// MARK: - Gathering data
import Foundation

struct Clouds: Codable {
    let cover: String?
    let base: Int?
    
}

struct Metar: Codable {
    let icaoId: String
    let reportTime: String
    let rawOb: String
    let name: String
    let clouds: [Clouds]
}
