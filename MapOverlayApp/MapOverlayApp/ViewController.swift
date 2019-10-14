//
//  ViewController.swift
//  MapOverlayApp
//
//  Created by Basith on 14/10/19.
//  Copyright © 2019 TechPro. All rights reserved.
//

import UIKit
import MapKit
let citycordinate = CLLocationCoordinate2DMake(9.9312, 76.2673)

class cityCenterCoordinate:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D = citycordinate
    var identifier = "City"
    var title: String? = "Kochi"

}
class ViewController: UIViewController,MKMapViewDelegate {
    let pizzain = UIImage(named: "Image")
    let pii = UIImage(named: "Image-1")
    let mycity = cityCenterCoordinate()
    let hospitals = CityLocations().hospital
    @IBOutlet weak var mapview: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let region = MKCoordinateRegion(center: citycordinate, latitudinalMeters: 50000, longitudinalMeters: 50000)
        mapview.setRegion(region, animated: true)
        mapview.addAnnotation(mycity)
        mapview.addAnnotations(hospitals)
        let circle = MKCircle(center: citycordinate, radius: 10000)
        mapview.addOverlay(circle)
        mapview.delegate = self
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKCircle {
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
            circleRenderer.strokeColor = UIColor.blue
            circleRenderer.lineWidth = 1
            return circleRenderer
        }
        return MKOverlayRenderer(overlay: overlay)
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? cityCenterCoordinate{
            if let view = mapview.dequeueReusableAnnotationView(withIdentifier: "center") as? MKPinAnnotationView{
                return view
            }else{
                let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "center")
                view.image = pizzain
                view.isEnabled = true
                view.leftCalloutAccessoryView = UIImageView(image: pizzain)
                view.canShowCallout = true
                return view
            }
        }else if let annotation = annotation as? CityLocation {
            if let view = mapview.dequeueReusableAnnotationView(withIdentifier: "center") as? MKPinAnnotationView{
                return view
            }else{
                let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "center")
                view.image = pii
                view.isEnabled = true
                view.leftCalloutAccessoryView = UIImageView(image: pii)
                view.canShowCallout = true
                return view
            }
        }
        return nil;
    }
    


}

