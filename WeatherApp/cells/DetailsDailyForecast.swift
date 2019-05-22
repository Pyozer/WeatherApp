//
//  DetailsDailyForecast.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class DetailsDailyForecast : UITableViewCell {
    
    @IBOutlet weak var labelDay: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelMinTemp: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    
    func setData(_ dailyData: DataPoint) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        labelDay.text = dateFormatter.string(from: dailyData.time)
        
        if let _icon = dailyData.icon {
            icon.image = UIImage(named: _icon.rawValue)
        }
        if let _minTemp = dailyData.temperatureMin {
            labelMinTemp.text = "\(String(format: "%.0f", _minTemp))°C"
        }
        if let _maxTemp = dailyData.temperatureMax {
            labelMaxTemp.text = "\(String(format: "%.0f", _maxTemp))°C"
        }
    }
}
