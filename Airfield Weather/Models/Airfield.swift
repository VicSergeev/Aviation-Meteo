//
//  Airfield.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

// MARK: - for TableView
struct Airfield {
    let icaoCode: String
    let name: String
    
    var title: String {
        "\(icaoCode.uppercased()) \(name)"
    }
    
    static func getAirfields() -> [Airfield] {
        var airfields: [Airfield] = []
        let dataStore = DataStore.shared
        
        let icaoCodes = dataStore.icaoCodes
        let names = dataStore.cityNames
        
        let iterationsCount = min(
            icaoCodes.count,
            names.count
        )
        
        for index in 0..<iterationsCount {
            let airfield = Airfield(
                icaoCode: icaoCodes[index],
                name: names[index]
            )
            
            airfields.append(airfield)
        }
        
        return airfields
    }
}

