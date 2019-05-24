//
//  SearchCityController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 23/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import CoreLocation

class SearchCityController : BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var locationResults: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func onTextChange(_ sender: UITextField) {
        if let _search = sender.text {
            ApiManager.searchCity(
                city: _search,
                onSuccess: { response in
                    DispatchQueue.main.async {
                        self.locationResults = response.results
                        self.tableView.reloadData()
                    }
                },
                onFail: { error in
                    self.showAlert(error?.localizedDescription ?? "Unknown error")
                }
            )
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationResults?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let _location = locationResults?[indexPath.row] else {
            return UITableViewCell()
        }
        
        if let _formatted = _location.formatted {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! SearchCityCell
            cell.setCity("\(_location.annotations?.flag ?? "") \(_formatted)")
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let _location = locationResults?[indexPath.row] else {
            return
        }
        guard let _formatted = _location.formatted else {
            return
        }
        guard let _lat = _location.geometry?.lat, let _lng = _location.geometry?.lng else {
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.city = City(name: _formatted, coordinates: CLLocationCoordinate2D(latitude: _lat, longitude: _lng))
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
