//
//  DetailsTitleCell.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class DetailsTitleCell : UITableViewCell {
    
    @IBOutlet weak var sectionTitle: UILabel!
    
    func setTitle(_ title: String) {
        sectionTitle.text = title
    }
}
