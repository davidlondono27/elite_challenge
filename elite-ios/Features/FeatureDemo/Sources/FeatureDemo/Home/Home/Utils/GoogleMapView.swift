//
//  GoogleMapView.swift
//  elite-ios
//
//  Created by David Londono on 04/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import GoogleMaps
import SwiftUI

struct GoogleMapView: UIViewRepresentable {
    @Binding var coordinate: CLLocationCoordinate2D

    func makeUIView(context: Context) -> GMSMapView {
        let GMSMapViewOptions = GMSMapViewOptions()
        GMSMapViewOptions.camera = .camera(withLatitude: coordinate.latitude, longitude: coordinate.longitude, zoom: 6.0)
        let mapView = GMSMapView(options: GMSMapViewOptions)
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        let camera = GMSCameraPosition.camera(
            withLatitude: coordinate.latitude,
            longitude: coordinate.longitude,
            zoom: 10
        )
        uiView.animate(to: camera)
    }
}

// MARK: - Se usará MapKit de Apple debido a un problema con el API_Key o con el Render de Google Maps
//            GoogleMapView(coordinate: $coordinate)
