//
//  UIWindow+Device.swift
//  TestingUtilities
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow {
    /// Get an instance of `UIWindow` with the current device size
    static func deviceFrame() -> UIWindow {
        UIWindow(frame: UIScreen.main.bounds)
    }

    /**
        Add a given view controller to the window and make it visible
        - Parameter controller: view controller to be shown
     */
    func showTestWindow(controller: UIViewController) {
        self.rootViewController = controller
        self.makeKeyAndVisible()
    }

    ///  Remove the root view controller from the window and make it not visible
    func cleanTestWindow() {
        self.rootViewController = nil
        self.isHidden = true
    }
}
