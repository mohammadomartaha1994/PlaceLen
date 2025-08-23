//
//  MainViewModel.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 13/08/25.
//
import SwiftUI
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    @Published var region: MKCoordinateRegion?
    @Published var isLoading = true
    @Published var address: String = "Fetching address..."
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // Location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            DispatchQueue.main.async {
                let offsetLatituede = location.coordinate.latitude - 0.005
                self.region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: offsetLatituede, longitude: location.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
                self.isLoading = false
            }
            fetchAddress(from: location)
        }
    }
    
    // Reverse geocode to get address
    private func fetchAddress(from location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Reverse geocode failed: \(error.localizedDescription)")
                DispatchQueue.main.async {
                    self.address = "Unable to get address"
                }
                return
            }
            
            if let placemark = placemarks?.first {
                let name = placemark.name ?? ""
                let city = placemark.locality ?? ""
                let country = placemark.country ?? ""
                DispatchQueue.main.async {
                    self.address = "\(name), \(city), \(country)"
                }
            }
        }
    }
}

