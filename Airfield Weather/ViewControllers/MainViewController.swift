//
//  DetailViewController.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var metars: [Metar] = []
    private let networkManager = NetworkManager.shared
    
    @IBOutlet var icaoCodeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var dewPointLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var visibilityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var metarRawLabel: UILabel!
    @IBOutlet var timeUpdatedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMetar()
    }
    
    private func fetchMetar() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyyMMdd_HHmmss"
        let link = URL(string: "https://aviationweather.gov/api/data/metar?ids=URRP&format=json&taf=false&hours=1&date=\(dateFormatter.string(from: currentDate))Z")!
        
        networkManager.fetchMetar(from: link) { [unowned self] result in
            switch result {
            case .success(let metars):
                self.metars = metars
                for metar in metars {
                    cityNameLabel.text = metar.airportName
                    icaoCodeLabel.text = metar.icaoCode
                    tempLabel.text = String(metar.temperature) + " °C"
                    dewPointLabel.text = String(metar.dewPoint) + " °C"
                    visibilityLabel.text = metar.visibility + " km"
                    windSpeedLabel.text = String(metar.windSpeed) + " kn"
                    metarRawLabel.text = metar.rawMetarData
                    timeUpdatedLabel.text = metar.reportTime + "UTC"
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}
