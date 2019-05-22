//
//  DetailsExtraInfos.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

struct ExtraInfo {
    let title: String
    let value: String
}

class DetailsExtraInfos : UITableViewCell {
    
    @IBOutlet weak var labelLeftTitle: UILabel!
    @IBOutlet weak var labelLeftValue: UILabel!
    @IBOutlet weak var labelRightTitle: UILabel!
    @IBOutlet weak var labelRightValue: UILabel!
    
    func setData(leftData: ExtraInfo, rightData: ExtraInfo) {
        labelLeftTitle.text = leftData.title
        labelLeftValue.text = leftData.value
        labelRightTitle.text = rightData.title
        labelRightValue.text = rightData.value
    }
    
}
