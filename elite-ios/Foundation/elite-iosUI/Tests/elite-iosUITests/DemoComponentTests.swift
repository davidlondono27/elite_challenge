//
//  DemoComponentTests.swift
//  eliteiosUITests
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

@testable import eliteiosUI
import SwiftUI
import TestingUtilities

// swiftlint:disable static_over_final_class
final class DemoComponentTests: QuickSpecTestBase {
    override class func spec() {
        let isRecording: Bool = false
        describe("DemoComponent") {
            context("should have expected layout when") {
                beforeEach {
                    // MARK: REMOVE THIS YOU DON'T NEED.
                }
                it("init") {
                    let sut = DemoComponent()
                    compareOrRecordSnapshot(sut, isRecording: isRecording)
                }
                afterEach {
                    // MARK: REMOVE THIS YOU DON'T NEED.
                }
            }
        }
    }
}
// swiftlint:enable static_over_final_class
