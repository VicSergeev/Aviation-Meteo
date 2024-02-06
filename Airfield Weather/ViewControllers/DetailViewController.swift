//
//  DetailViewController.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    @IBOutlet var icaoCodeLabel: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var dewPointLabel: UILabel!
    @IBOutlet var windDirectionLabel: UILabel!
    @IBOutlet var cloudsLabel: UILabel!
    @IBOutlet var metarLabel: UILabel!
    @IBOutlet var tafLabel: UILabel!
    @IBOutlet var cityName: UILabel!
    
    
    var airfield: Airfield!
    // json model
    //

    override func viewDidLoad() {
        super.viewDidLoad()
        icaoCodeLabel.text = airfield.icaoCode
        cityName.text = airfield.name
    }

}
