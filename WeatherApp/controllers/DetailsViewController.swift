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
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func getSectionTitle(_ section: Int) -> String {
        if section == 1 {
            return forecast?.hourly?.summary ?? "Hourly"
        }
        if section == 2 {
            return forecast?.daily?.summary ?? "Daily"
        }
        if section == 3 {
            return "Extra informations"
        }
        return ""
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1 + (forecast?.hourly?.data.count ?? 0)
        case 2:
            return 1 + (forecast?.daily?.data.count ?? 0)
        case 3:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _forecast = forecast else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            if let _current = _forecast.currently {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsHeaderCell", for: indexPath) as! DetailsHeaderCell
                cell.setData(_current)
                return cell
            }
        } else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTitleCell", for: indexPath) as! DetailsTitleCell
                cell.setTitle(getSectionTitle(indexPath.section))
                return cell
            }
            switch indexPath.section {
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsHourlyCell", for: indexPath) as! DetailsHourlyForecast
                cell.setData(hourlyData: _forecast.hourly!.data[indexPath.row - 1])
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsDailyCell", for: indexPath) as! DetailsDailyForecast
                cell.setData(_forecast.daily!.data[indexPath.row - 1])
                return cell
            /*case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsExtraCell", for: indexPath) as! DetailsExtraInfos
                cell.setData(extraInfo: _forecast.currently!)
                return cell*/

            default: return UITableViewCell()
            }
        }
        
        return UITableViewCell()
    }
}
