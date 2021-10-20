
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var currentLoc: CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let alert = UIAlertController(title: "Instructions", message: "Click add location to set a marker for current loc where you found diseased plants for future reference", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        mapView.delegate = self
        setupLocationManager()
    }
    
    @IBAction func addLoc(_ sender: Any) {
        setupLocationManager()
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentLoc
        let alert = UIAlertController(title: "Disease Name", message: "Type name of disease you found at this location", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = "name"
        }
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            annotation.title = textField?.text
        }))
        self.present(alert, animated: true)
        mapView.addAnnotation(annotation)
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        self.locationManager?.requestWhenInUseAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager?.stopMonitoringSignificantLocationChanges()
        currentLoc = manager.location!.coordinate
        print(manager.location!.coordinate)
        locationManager?.stopUpdatingLocation()
    }
}
