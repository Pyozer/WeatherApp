//
//  DetailsViewController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import ForecastIO

class DetailsViewController : UIViewController, UITableViewDataSource {
    var city: City?
    var forecast: Forecast?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.title = city?.name
        fetchWeatherData()
    }
    
    private func fetchWeatherData() {
        if let _city = city {
            ApiManager.getWeatherForecast(
                city: _city,
                onSuccess: { result in
                    self.forecast = result
                    self.tableView.reloadData()
                },
                onFail: { error in
                    self.showAlert(error?.localizedDescription ?? "Error during fetch weather data")
                }
            )
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 3, 5:
            return 1
        case 2:
            return forecast?.hourly?.data.count ?? 0
        case 4:
            return forecast?.daily?.data.count ?? 0
        case 6:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _forecast = forecast else {
            return UITableViewCell()
        }
        if indexPath.section == 0, let _current = _forecast.currently {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsHeaderCell", for: indexPath) as! DetailsHeaderCell
            cell.setData(_current)
            return cell
        }
        
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterInfoCell", for: indexPath)
        if indexPath.section == 1 {
            cell.textLabel?.text = character?.titles[indexPath.row]
        } else if indexPath.section == 2 {
            cell.textLabel?.text = character?.siblings[indexPath.row]
        }
        return cell*/
        
        return UITableViewCell()
    }
}
