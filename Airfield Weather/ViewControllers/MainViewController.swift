//
//  DetailViewController.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import UIKit

enum Link {
    
    case URRP
    
    var url: URL {
        let urlString = "https://aviationweather.gov/api/data/metar?ids=URRP&format=json&taf=false&hours=1&date=20240201_195943Z"
        return URL(string: urlString)!
    }
}

final class MainViewController: UIViewController {
    
    private var metars: [Metar] = []
    
    @IBOutlet var icaoCodeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var dewPointLabel: UILabel!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var visibilityLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var metarRawLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataFromAPI()
    }

}

// MARK: - Networking
extension MainViewController {
    
    func fetchDataFromAPI() {
        URLSession.shared.dataTask(with: Link.URRP.url) { [weak self] data, _, error in
            guard let self else { return }
            guard let data else {
                print(error ?? "No error description")
                return
            }
            do {
                metars = try JSONDecoder().decode([Metar].self, from: data)
                DispatchQueue.main.async { [self] in
                    for metar in self.metars {
                        self.tempLabel.text = String(metar.temp)
                        self.dewPointLabel.text = String(metar.dewp)
                        self.icaoCodeLabel.text = metar.icaoId
                        self.cityNameLabel.text = metar.name
                        self.visibilityLabel.text = String(metar.visib)
                        self.windSpeedLabel.text = String(metar.wspd)
                        self.metarRawLabel.text = metar.rawOb
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
