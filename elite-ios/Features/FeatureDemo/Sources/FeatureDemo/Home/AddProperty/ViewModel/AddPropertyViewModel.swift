//
//  AddPropertyViewModel.swift
//  FeatureDemo
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Combine
import Foundation
import PhotosUI
import SwiftUI

final class AddPropertyViewModel: AddPropertyViewModelProtocol {
    @Published var propertyTitle: String = ""
    @Published var propertyDescription: String = ""
    @Published var images: [Image] = []
    @Published var photosPicker: [PhotosPickerItem] = []
    @Published var propertyTypeSelection: String = ""
    @Published var propertyType: [String] = ["Apartamento",
                                             "Cabaña",
                                             "Casa",
                                             "Finca",
                                             "Glamping"
    ]
    @Published private(set) var maxPeopleEnabled: String = ""
    @Published private(set) var bedPerProperty: String = ""
    @Published private(set) var bathPerProperty: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
    }

    @MainActor
    func updateImages() async {
        images = await photosPicker.convertToImages()
    }

    func updateMaxPeopleEnabled(_ value: String) {
        maxPeopleEnabled = value.filter { $0.isNumber }
    }

    func updateBedPerProperty(_ value: String) {
        bedPerProperty = value.filter { $0.isNumber }
    }

    func updateBathPerProperty(_ value: String) {
        bathPerProperty = value.filter { $0.isNumber }
    }
}

private extension Array where Element == PhotosPickerItem {
    @MainActor
    func convertToImages() async -> [Image] {
        var images: [Image] = []
        for item in self {
            do {
                if let data = try await item.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    images.append(Image(uiImage: uiImage))
                } else {
                    images.append(Image(systemName: "xmark.octagon"))
                }
            } catch {
                print(error.localizedDescription)
                images.append(Image(systemName: "xmark.octagon"))
            }
        }
        return images
    }
}
