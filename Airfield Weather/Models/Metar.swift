//
//  Forecast.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
//

// MARK: - Gathering data
import Foundation

struct Metar: Decodable {
    let icaoCode: String
    let airportName: String
    let dewPoint: Int
    let temperature: Int
    let rawMetarData: String
    let visibility: String
    let windSpeed: Int
    let reportTime: String
    
    init(
        icaoCode: String,
        airportName: String,
        dewPoint: Int,
        temperature: Int,
        rawMetarData: String,
        visibility: String,
        windSpeed: Int,
        reportTime: String
    ) {
        self.icaoCode = icaoCode
        self.airportName = airportName
        self.dewPoint = dewPoint
        self.temperature = temperature
        self.rawMetarData = rawMetarData
        self.visibility = visibility
        self.windSpeed = windSpeed
        self.reportTime = reportTime
    }
    
    init(metarDetail: [String: Any]) {
        icaoCode = metarDetail["icaoId"] as? String ?? ""
        airportName = metarDetail["name"] as? String ?? ""
        dewPoint = metarDetail["dewp"] as? Int ?? 0
        temperature = metarDetail["temp"] as? Int ?? 0
        rawMetarData = metarDetail["rawOb"] as? String ?? ""
        visibility = metarDetail["visib"] as? String ?? ""
        windSpeed = metarDetail["wspd"] as? Int ?? 0
        reportTime = metarDetail["reportTime"] as? String ?? ""
    }
    
    static func getMetar(from value: Any) -> [Metar] {
        guard let metarDetails = value as? [[String: Any]] else { return [] }
        return metarDetails.map { Metar(metarDetail: $0) }
    }
}
