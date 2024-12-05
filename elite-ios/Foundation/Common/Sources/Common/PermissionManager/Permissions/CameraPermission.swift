//
//  CameraPermission.swift
//  Common
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import AVFoundation

final class CameraPermission: Permission {
    var type: AppPermission = .camera

    func requestPermission() async -> Bool {
        await AVCaptureDevice.requestAccess(for: .video)
    }

    func isPermissionGranted() -> Bool {
        AVCaptureDevice.authorizationStatus(for: .video) == .authorized
    }

    func status() async -> PermissionsStatus {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            return .authorized
        case .notDetermined:
            return .neverAsked
        default:
            return .denied
        }
    }
}
