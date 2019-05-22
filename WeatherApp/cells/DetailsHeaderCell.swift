//
//  DetailsHeaderCell.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class DetailsHeaderCell : UITableViewCell {
    
    @IBOutlet weak var headerCity: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTemp: UILabel!
    @IBOutlet weak var headerWeather: UILabel!
    
    func setData(_ current: DataPoint, _ city: String) {
        headerCity.text = city
        if let _icon = current.icon {
            headerImage.image = UIImage(named: _icon.rawValue)
        }
        if let _temp = current.temperature {
            headerTemp.text = "\(_temp)°C"
        }
        headerWeather.text = current.summary
    }
    
}
