//
//  AddPropertyViewModelProtocol.swift
//  FeatureDemo
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Combine
import PhotosUI
import SwiftUI

protocol AddPropertyViewModelProtocol: AnyObject, ObservableObject {
    var propertyTitle: String { get set }
    var propertyDescription: String { get set }
    var propertyType: [String] { get set }
    var propertyTypeSelection: String { get set }
    var maxPeopleEnabled: String { get }
    var bedPerProperty: String { get }
    var bathPerProperty: String { get }
    var images: [Image] { get set }
    var photosPicker: [PhotosPickerItem] { get set }

    func updateImages() async
    func updateMaxPeopleEnabled(_ value: String)
    func updateBedPerProperty(_ value: String)
    func updateBathPerProperty(_ value: String)
}
