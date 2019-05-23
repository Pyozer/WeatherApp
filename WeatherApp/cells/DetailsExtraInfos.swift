//
//  DetailsExtraInfos.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class DetailsExtraInfos : UITableViewCell {
    
    @IBOutlet weak var labelLeftTitle: UILabel!
    @IBOutlet weak var labelLeftValue: UILabel!
    @IBOutlet weak var labelRightTitle: UILabel!
    @IBOutlet weak var labelRightValue: UILabel!
    
    func setData(_ currentForecast: DataPoint, _ index: Int) {
        if index == 1 {
            labelLeftTitle.text = "Humidity"
            labelLeftValue.text = "\(((currentForecast.humidity ?? 0.0) * 100.0).toRoundString())%"
            labelRightTitle.text = "Wind Speed"
            labelRightValue.text = Utils.formatSpeed(currentForecast.windSpeed ?? 0.0)
        } else if index == 2 {
            labelLeftTitle.text = "Pressure"
            labelLeftValue.text = "\((currentForecast.pressure ?? 0.0).toRoundString())hPa"
            labelRightTitle.text = "UV"
            labelRightValue.text = "\((currentForecast.uvIndex ?? 0.0).toRoundString())"
        }
    }
    
}
