//
//  HomeView.swift
//  FeatureDemo
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import LocalizedStrings
import SwiftUI
import Theme

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    @StateObject private var viewModel: ViewModel

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        Image.logo
            .frame(width: 200)
        Text(L10n.yourTextHere)
            .foregroundStyle(Color.exampleColor)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
