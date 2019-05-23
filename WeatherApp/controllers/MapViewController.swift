//
//  MapiewController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerTableView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather App"
        tableView.dataSource = self
        tableView.delegate = self
        setMapVisible(true)
        initMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    private func setMapVisible(_ showMap: Bool) {
        mapView.isHidden = !showMap
        containerTableView.isHidden = showMap
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "settings_icon"),
                style: .done,
                target: self,
                action: #selector(goToSettings)
            ),
            UIBarButtonItem(
                image: UIImage(named: mapView.isHidden ? "map_icon" : "list_icon"),
                style: .done,
                target: self,
                action: #selector(toggleMapVisible)
            )
        ]
    }
    
    @objc private func toggleMapVisible() {
        setMapVisible(mapView.isHidden)
    }
    
    @objc private func goToSettings() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsController") as? SettingsController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func onSearchBtnPressed(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchCityController") as? SearchCityController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    private func initMap() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        initMarkers()
    }
    
    private func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            locationManager.requestWhenInUseAuthorization()
        }
        mapView.showsUserLocation = true
    }
    
    private func initMarkers() {
        mapView.removeAnnotations(mapView.annotations)
        
        for city in CitiesData.list {
            let annotation = MKPointAnnotation()
            annotation.coordinate = city.coordinates
            annotation.title = city.name
            mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if let _city = view.annotation?.title, let _coords = view.annotation?.coordinate {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
            vc?.city = City(name: _city ?? "Unknown city name", coordinates: _coords)
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CitiesData.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CityCell
        cell.setCity(CitiesData.list[indexPath.row].name)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.city = CitiesData.list[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
