//
//  DetailsHourlyForecast.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import Lottie

class DetailsHourlyForecast : UITableViewCell {
    
    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var icon: AnimationView!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    
    func setData(hourlyData: DataPoint) {
        let calendar = Calendar.current
        let time = calendar.component(.hour, from: hourlyData.time)
        labelHour.text = "\(String(format: "%02d", time))h"
        
        if let _icon = hourlyData.icon {
            let weatherAnimation = Animation.named(_icon.rawValue)
            icon.animation = weatherAnimation
            icon.currentTime = TimeInterval((weatherAnimation?.duration ?? 0.0) / 2.0)
        }
        if let _humidity = hourlyData.humidity {
            if _humidity > 0 {
                labelHumidity.text = "\((_humidity * 100.0).toRoundString())%"
            }
        }
        if let _temp = hourlyData.temperature {
            labelTemp.text = Utils.formatTemperature(_temp)
        }
    }
    
}
