//
//  eliteiosApp.swift
//  elite-ios
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import FeatureDemo
import SwiftUI

@main
struct eliteiosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            FeatureDemo.start()
        }
    }
}
