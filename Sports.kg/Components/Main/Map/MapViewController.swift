//
//  MapViewController.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import UIKit
import MapKit

protocol MapViewProtocol: AnyObject {
    func reloadData()
}

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    private lazy var segmentedView: UISegmentedControl = {
        let segmented = UISegmentedControl()
        return segmented
    }()
    
    private let applemapView: MKMapView = {
        let map = MKMapView()
        return map
    }()
    
    var presenter: MapPresenterProtocol!
    private let configurator: MapConfiguratorProtocol = MapConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Карта"

        configurator.configure(with: self)
        
        view.addSubview(applemapView)
        
        applemapView.delegate = self
        
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        presenter.getAllLocations()
        
        applemapView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //        let coordinates = CLLocationCoordinate2D(
        //            latitude: locationManager.location?.coordinate.latitude ?? 0.0,
        //            longitude: locationManager.location?.coordinate.longitude ?? 0.0
        //        )
        
        let coordinates = CLLocationCoordinate2D(latitude: 42.883601, longitude: 74.593247)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        applemapView.setRegion(region, animated: true)
        
        // user
        let myPin = MKPointAnnotation()
        myPin.coordinate = coordinates
        
        myPin.title = "You"
        myPin.subtitle = "Your location"
        
        applemapView.addAnnotation(myPin)
    }
    
    func addPin(title: String, comments: String, latitude: Double, longitude: Double) {
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        pin.title = title
        pin.subtitle = comments
        applemapView.addAnnotation(pin)
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways:
            return
        case .authorizedWhenInUse:
            return
        case .denied:
            return
        case .restricted:
            locationManager.requestWhenInUseAuthorization()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        // Check for type here, not for the Title!!!
        if annotation is MKUserLocation {
            // we do not want to return a custom View for the User Location
            return nil
        }
        let identifier = "custom"
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        
//        if annotationView == nil {
//            // create view
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            annotationView.canShowCallout = true
//        } else {
//            // assign annotation
//        }
        
        annotationView.annotation = annotation
        annotationView.canShowCallout = true
        // set custom annotaion
        if annotation.title == "You" {
            //annotationView.image = UIImage(systemName: "mappin.circle")
        } else {
            annotationView.image = UIImage(named: "pin")
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        for loc in presenter.locations {
            if loc.title == view.annotation?.title && loc.address == view.annotation?.subtitle {
                presenter.showDetails(location: loc)
            }
        }
        
    }
    
}

// MARK: - MapViewController
extension MapViewController: MapViewProtocol {
    func reloadData() {
        for location in presenter.locations {
            guard let title = location.title,
                  let address = location.address,
                  let latitude = location.latitude,
                  let longtitude = location.longitude
            else { return }
            addPin(title: title, comments: address, latitude: latitude, longitude: longtitude)
        }
    }
}
