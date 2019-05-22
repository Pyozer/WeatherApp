//
//  DetailsHourlyForecast.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class DetailsHourlyForecast : UITableViewCell {
    
    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelPrecipitation: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    
    func setData(hourlyData: DataPoint) {
        let calendar = Calendar.current
        let time = calendar.component(.hour, from: hourlyData.time)
        labelHour.text = "\(String(format: "%02d", time))h"
        
        if let _icon = hourlyData.icon {
            icon.image = UIImage(named: _icon.rawValue)
        }
        if let _humidity = hourlyData.humidity {
            labelPrecipitation.text = "\(String(format: "%.0f", _humidity * 100.0))%"
        }
        if let _temp = hourlyData.temperature {
            labelTemp.text = "\(String(format: "%.0f", _temp))°C"
        }
    }
    
}
