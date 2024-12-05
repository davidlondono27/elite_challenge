//
//  Configuration.swift
//  Common
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Foundation

struct Configuration {
    static func value(for key: String) -> String {
        guard let object = Bundle.main.object(forInfoDictionaryKey: key) as? String else { return "" }
        return object
    }
}
