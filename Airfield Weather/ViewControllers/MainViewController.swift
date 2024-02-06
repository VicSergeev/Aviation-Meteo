//
//  ViewController.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
//

import UIKit

enum Link {
    
    case URRP
    
    var url: URL {
        let currentDate = getDate()
        let urlString = "https://aviationweather.gov/api/data/metar?ids=\(self)&format=json&taf=false&hours=1&date=\(currentDate)"
        return URL(string: urlString)!
    }
    
    private func getDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyyMMdd_HHmmss"
        
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate + "Z"
    }
}

final class MainViewController: UITableViewController {
    private let networkManager = NetworkManager.shared
    private let cellIcon = UIImage(named: "icon")
    
    private var airfields = Airfield.getAirfields()

    override func viewDidLoad() {
        tableView.rowHeight = 100
        fetchForecast()
    }


    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let detailsVC = segue.destination as? DetailViewController
        detailsVC?.airfield = airfields[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension MainViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        airfields.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        let airfield = airfields[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = airfield.name
        content.secondaryText = airfield.icaoCode
        content.image = cellIcon
        
        cell.contentConfiguration = content
        
        return cell
    }
    
}

// MARK: - Networking
private extension MainViewController {
    func fetchForecast() {
        networkManager.fetchForecast(from: Link.URRP.url) { result in
            switch result {
            case .success(let metar):
                print(metar)
            case .failure(let error):
                print(error)
            }
        }
    }
}
