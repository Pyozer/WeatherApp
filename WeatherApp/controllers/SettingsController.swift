//
//  SettingsController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 23/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class SettingsController : UIViewController {
    
    @IBOutlet weak var langController: UISegmentedControl!
    @IBOutlet weak var unitController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        langController.selectedSegmentIndex = Settings.language == .en ? 0 : 1
        unitController.selectedSegmentIndex = Settings.unitSystem == .si ? 0 : 1
    }
    
    @IBAction func onLanguageChanged(_ sender: UISegmentedControl) {
        let selected = langController.selectedSegmentIndex
        if selected == 0 {
            Settings.language = Language.en
        } else if selected == 1 {
            Settings.language = Language.fr
        }
    }
    
    @IBAction func onUnitChanged(_ sender: UISegmentedControl) {
        let selected = unitController.selectedSegmentIndex
        if selected == 0 {
            Settings.unitSystem = Units.si
        } else if selected == 1 {
            Settings.unitSystem = Units.us
        }
    }
}
