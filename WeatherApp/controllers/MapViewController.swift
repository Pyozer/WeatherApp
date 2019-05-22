//
//  MapiewController.swift
//  WeatherApp
//
//  Created by Jean-Charles Moussé on 22/05/2019.
//  Copyright © 2019 Jean-Charles Moussé. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
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

}
