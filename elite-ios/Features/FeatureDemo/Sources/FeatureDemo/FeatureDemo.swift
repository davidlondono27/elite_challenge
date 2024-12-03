//
//  FeatureDemo.swift
//  FeatureDemo
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import SwiftUI

public final class FeatureDemo {
    public static func start() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}

