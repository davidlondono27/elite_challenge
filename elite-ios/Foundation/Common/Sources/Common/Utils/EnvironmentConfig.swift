//
//  Environment.swift
//  Common
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Foundation

public struct EnvironmentConfig {
    public static var apiBaseUrl: String {
        Configuration.value(for: "API_BASE_URL")
    }
    
    public static var googleMapsAPIKey: String {
        Configuration.value(for: "GOOGLEMAPS_APIKEY")
    }
}
