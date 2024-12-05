//
//  AddPropertyViewTests.swift
//  FeatureDemoTests
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

@testable import FeatureDemo
import SwiftUI
import TestingUtilities

// swiftlint:disable static_over_final_class
final class AddPropertyViewTests: QuickSpecTestBase {
    override class func spec() {
        let isRecording: Bool = false
        describe("AddPropertyView") {
            context("should have expected layout when") {
                it("init") {
                    let viewModel = AddPropertyViewModel()
                    let sut = AddPropertyView(viewModel: viewModel)
                    compareOrRecordSnapshot(sut, isRecording: isRecording)
                }
            }
        }
    }
}
// swiftlint:enable static_over_final_class
