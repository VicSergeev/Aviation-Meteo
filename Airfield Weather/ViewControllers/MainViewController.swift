//
//  ViewController.swift
//  Airfield Weather
//
//  Created by Vic on 31.01.2024.
//

import UIKit

final class MainViewController: UITableViewController {
    private var airfields = Airfield.getAirfields()
    private let cellIcon = UIImage(named: "icon")

    override func viewDidLoad() {
        tableView.rowHeight = 100
        
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
        guard let cell = cell as? CityCell else { return UITableViewCell() }
        let airfield = airfields[indexPath.row]
        
        return cell
    }
    
}

// MARK: - Networking
extension MainViewController {
    func fetchForecast(with icaoCode: String) {
        guard let link = Link(rawValue: icaoCode)?.url else {
            print("Invalid ICAO code")
            return
        } // creating link
        
        URLSession.shared.dataTask(with: link) { data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let forecast = try JSONDecoder().decode([Metar].self, from: data)
            } catch {
                print(print("Error: \(error.localizedDescription)"))
            }
        }.resume()
    } // METHOD
}
