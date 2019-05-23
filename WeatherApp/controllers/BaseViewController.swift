//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 24/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit

class BaseViewController : UIViewController {
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
}
