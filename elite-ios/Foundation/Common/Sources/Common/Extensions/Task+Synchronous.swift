//
//  Task+Synchronous.swift
//  Common
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Foundation

public extension Task where Failure == Error {
    /// Performs an async task in a sync context.
    /// - Note: This function blocks the thread until the given operation is finished. The caller is responsible for managing multithreading.
    static func synchronous(priority: TaskPriority? = nil, operation: @escaping @Sendable () async throws -> Success) {
        let semaphore = DispatchSemaphore(value: 0)
        Task(priority: priority) {
            defer { semaphore.signal() }
            return try await operation()
        }
        semaphore.wait()
    }
}
