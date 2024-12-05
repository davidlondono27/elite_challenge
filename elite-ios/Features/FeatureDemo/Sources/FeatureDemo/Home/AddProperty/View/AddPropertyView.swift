//
//  AddPropertyView.swift
//  FeatureDemo
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import eliteiosUI
import LocalizedStrings
import PhotosUI
import SwiftUI
import Theme

struct AddPropertyView<ViewModel>: View where ViewModel: AddPropertyViewModelProtocol {
    @StateObject private var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        VStack(spacing: .zero) {
            ScrollView {
                VStack(spacing: .layoutSize6) {
                    CustomTextField(title: L10n.title,
                                    content: $viewModel.propertyTitle,
                                    tip: L10n.apartmentWithSeaView)
                    CustomTextField(title: L10n.description,
                                    content: $viewModel.propertyDescription,
                                    tip: L10n.bigApartmentWithGoodEnvironment)
                    PhotosPicker(selection: $viewModel.photosPicker,
                                 maxSelectionCount: .maxSelectionPhotos,
                                 matching: .images) {
                        PlaneButton(title: L10n.addThePhotos,
                                    content: L10n.maxFivePhotos,
                                    image: Image(systemName: "photo.badge.plus.fill"))
                        .foregroundStyle(.black)
                    }
                                 .onChange(of: viewModel.photosPicker) {
                                     Task {
                                         await viewModel.updateImages()
                                     }
                                 }
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.images.indices, id: \.self) { index in
                                viewModel.images[index]
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(8)
                                    .scaledToFit()
                                    .onTapGesture { hideKeyboard() }
                            }
                        }
                    }
                    .animation(.easeInOut, value: viewModel.images)
                    Menu {
                        ForEach(viewModel.propertyType, id: \.self) { type in
                            Button {
                                hideKeyboard()
                                viewModel.propertyTypeSelection = type
                            } label: {
                                Text(type)
                            }
                        }
                    } label: {
                        PlaneButton(title: L10n.propertyType,
                                    content: viewModel.propertyTypeSelection.isEmpty ?
                                    L10n.apartmentHouse : viewModel.propertyTypeSelection)
                    }
                    CustomTextField(title: L10n.maxPeople,
                                    content: Binding(
                                        get: { viewModel.maxPeopleEnabled },
                                        set: { viewModel.updateMaxPeopleEnabled($0) }
                                    ),
                                    tip: L10n.five,
                                    keyboardType: .numberPad)
                    CustomTextField(title: L10n.roomsNumber,
                                    content: Binding(
                                        get: { viewModel.bedPerProperty },
                                        set: { viewModel.updateBedPerProperty($0) }
                                    ),
                                    tip: L10n.two,
                                    keyboardType: .numberPad)
                    CustomTextField(title: L10n.bathNumber,
                                    content: Binding(
                                        get: { viewModel.bathPerProperty },
                                        set: { viewModel.updateBathPerProperty($0) }
                                    ),
                                    tip: L10n.one,
                                    keyboardType: .numberPad)
                }
            }
            Spacer()
            PrimaryButton(text: L10n.addProperty,
                          action: { hideKeyboard() })
            .padding(.bottom)
        }
        .padding(.horizontal, .layoutSize12)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.azulPrincipal)
                }
            }
            ToolbarItem(placement: .principal) {
                Text(L10n.addNewProperty)
                    .fontWeight(.semibold)
                    .font(.title2)
                    .foregroundStyle(.black)
            }
        }
    }
}

private extension CGFloat {
    static let layoutSize6: CGFloat = 6
    static let layoutSize8: CGFloat = 8
    static let layoutSize10: CGFloat = 10
    static let layoutSize12: CGFloat = 12
}

private extension Int {
    static let maxSelectionPhotos: Int = 5
}
