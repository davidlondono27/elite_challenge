//
//  View+HideKeyboard.swift
//  eliteiosUI
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import SwiftUI
import UIKit

public extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
