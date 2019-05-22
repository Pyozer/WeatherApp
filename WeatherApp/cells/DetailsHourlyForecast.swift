//
//  DetailsHourlyForecast.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import ForecastIO

class DetailsHourlyForecast : UITableViewCell {
    
    @IBOutlet weak var labelHour: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var labelPrecipitation: UILabel!
    @IBOutlet weak var labelTemp: UILabel!
    
    func setData(hourlyData: Forecast) {
        hourlyData.hourly?.data
    }
    
}
