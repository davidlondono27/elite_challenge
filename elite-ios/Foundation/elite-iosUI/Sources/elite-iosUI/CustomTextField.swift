//
//  CustomTextField.swift
//  eliteiosUI
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import SwiftUI

public struct CustomTextField: View {
    private var title: String
    private var content: Binding<String>
    private var tip: String?
    private var image: Image?
    private var isEnabled: Bool
    private var keyboardType: UIKeyboardType

    public init(title: String,
                content: Binding<String>,
                tip: String? = nil,
                image: Image? = nil,
                isEnabled: Bool = true,
                keyboardType: UIKeyboardType = .default) {
        self.title = title
        self.content = content
        self.tip = tip
        self.image = image
        self.isEnabled = isEnabled
        self.keyboardType = keyboardType
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            HStack {
                image
                TextField(tip ?? "", text: content)
                    .foregroundStyle(isEnabled ? .black : .gray.opacity(0.6))
                    .disabled(!isEnabled)
                    .keyboardType(keyboardType)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .frame(height: 56)
                    .foregroundStyle(.gray.opacity(0.12))
            }
        }
    }
}
