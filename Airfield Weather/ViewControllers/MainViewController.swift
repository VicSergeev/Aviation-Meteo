//
//  DetailViewController.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var metars: [Metar] = []
    
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
        fetchDataFromAPI()
    }

}

// MARK: - Networking
extension MainViewController {
    
    func fetchDataFromAPI() {
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyyMMdd_HHmmss"
        
        guard let url = URL(string: "https://aviationweather.gov/api/data/metar?ids=URRP&format=json&taf=false&hours=1&date=\(dateFormatter.string(from: currentDate))Z") else {
            print("Invalid link")
            return
        }
//        Link.URRP.url
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error ?? "No error description")
                return
            }
            do {
                metars = try JSONDecoder().decode([Metar].self, from: data)
                DispatchQueue.main.async { [self] in
                    for metar in self.metars {
                        self.tempLabel.text = String(metar.temp) + " C'"
                        self.dewPointLabel.text = String(metar.dewp) + " C'"
                        self.icaoCodeLabel.text = metar.icaoId
                        self.cityNameLabel.text = metar.name
                        self.visibilityLabel.text = String(metar.visib) + " km"
                        self.windSpeedLabel.text = String(metar.wspd) + " kn"
                        self.metarRawLabel.text = metar.rawOb
                        self.timeUpdatedLabel.text = metar.reportTime + " UTC"
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
