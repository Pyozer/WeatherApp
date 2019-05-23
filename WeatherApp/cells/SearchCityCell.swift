//
//  CityCell.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class SearchCityCell : UITableViewCell {
    
    @IBOutlet weak var city: UILabel!
    
    func setCity(_ cityName: String) {
        city.text = cityName
    }
}
