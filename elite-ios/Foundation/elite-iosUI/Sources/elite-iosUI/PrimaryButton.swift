//
//  PrimaryButton.swift
//  eliteiosUI
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import SwiftUI
import Theme

public struct PrimaryButton: View {
    private var text: String
    private var action: () -> Void

    public init(text: String,
                action: @escaping () -> Void
    ) {
        self.text = text
        self.action = action
    }

    public var body: some View {
        HStack(spacing: .zero) {
            Button {
                action()
            } label: {
                Text(text)
                    .fontWeight(.regular)
                    .foregroundStyle(.white)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(Color.azulPrincipal)
                    }
            }
        }
    }
}
