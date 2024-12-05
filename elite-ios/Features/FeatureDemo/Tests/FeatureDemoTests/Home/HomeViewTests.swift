//
//  HomeViewTests.swift
//  FeatureDemoTests
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

@testable import FeatureDemo
import SwiftUI
import TestingUtilities

// swiftlint:disable static_over_final_class
final class HomeViewTests: QuickSpecTestBase {
    override class func spec() {
        let isRecording: Bool = false
        describe("HomeView") {
            context("should have expected layout when") {
                it("init") {
                    let homeViewModel = HomeViewModel()
                    let sut = HomeView(viewModel: homeViewModel)
                    compareOrRecordSnapshot(sut, isRecording: isRecording)
                }
            }
        }
    }
}
// swiftlint:enable static_over_final_class
