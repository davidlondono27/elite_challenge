//
//  HomeView.swift
//  FeatureDemo
//
//  Created by David Londono on 03/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import Common
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
        NavigationStack {
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
                Spacer()
                VStack {
                    NavigationLink {
                        AddPropertyView(viewModel: AddPropertyViewModel())
                    } label: {
                        Text(L10n.add)
                            .fontWeight(.semibold)
                            .font(.title2)
                            .foregroundStyle(.white)
                            .padding(.vertical, .layoutSize8)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(Color.azulPrincipal)
                            }
                    }
// swiftlint: disable force_unwrapping
                    Link(destination: URL(string: EnvironmentConfig.eliteWeb)!) {
                        Text(L10n.viewProperties)
                            .fontWeight(.regular)
                            .foregroundStyle(.white)
                            .padding(.vertical, .layoutSize8)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(Color.azulSecundario)
                            }
                    }
                }
// swiftlint: enable force_unwrapping
                .padding(.horizontal, .layoutSize6)
                .padding(.bottom, .layoutSize10)
            }
            .background(Color.white)
        }
    }
}

private extension CGFloat {
    static let layoutSize6: CGFloat = 6
    static let layoutSize8: CGFloat = 8
    static let layoutSize10: CGFloat = 10
}
