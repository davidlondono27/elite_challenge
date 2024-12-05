//
//  HomeView.swift
//  FeatureDemo
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import LocalizedStrings
import MapKit
import SwiftUI
import Theme

struct HomeView<ViewModel>: View where ViewModel: HomeViewModelProtocol {
    @StateObject private var viewModel: ViewModel

    init(viewModel: @autoclosure @escaping () -> ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        VStack {
            Image.logo
                .frame(width: 50)
            Text(L10n.welcome)
                .foregroundStyle(Color.azulPrincipal)
                .fontWeight(.semibold)
            Divider()
            Text(L10n.whatYouWantDo)
                .foregroundStyle(Color.azulPrincipal)
                .fontWeight(.semibold)
        }
    }
}
