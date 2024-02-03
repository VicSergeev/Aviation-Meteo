//
//  CityCell.swift
//  Airfield Weather
//
//  Created by Vic on 02.02.2024.
//

import UIKit

final class CityCell: UITableViewCell {
    @IBOutlet var icaoLabel: UILabel!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var cellImage: UIImageView!
    
    func configure(with airfield: Airfield) {
        
    }
}
