//
//  ForecastDetails.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import Foundation

enum Link: String {
    
    case UHMA, UHPP, UHSS, UHHH, UHBB, UHWW, UIII, UWLW, UWGG, UUDD, UUWW, UUEE, URMM, URSS, URKK, URRP, UWPP, USTR, USCC, USNN, USPP, USRR, USCM, UWWW, UWOO
    
    var url: URL {
        let currentDate = getDate()
        let urlString = "https://aviationweather.gov/api/data/metar?ids=" + self.rawValue + "&format=json&taf=false&hours=1&date=" + currentDate
        return URL(string: urlString)!
    }
    
    private func getDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyymmdd_HHmmss"
        
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate + "Z"
    }
}
