//
//  PlaneButton.swift
//  eliteiosUI
//
//  Created by David Londono on 05/12/2024.
//  Copyright © 2024 elite-ios. All rights reserved.
//

import SwiftUI

public struct PlaneButton: View {
    private var title: String
    private var content: String
    private var image: Image?
    private var isCollapsable: Bool
    private var isEnabled: Bool

    public init(title: String,
                content: String,
                image: Image? = nil,
                isCollapsable: Bool = false,
                isEnabled: Bool = true
    ) {
        self.title = title
        self.content = content
        self.image = image
        self.isCollapsable = isCollapsable
        self.isEnabled = isEnabled
    }

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(isEnabled ? .black : .gray.opacity(0.6))
            HStack {
                image
                Text(content)
                    .foregroundStyle(isEnabled ? .black : .gray.opacity(0.6))
                Spacer()
                if isCollapsable {
                    Image(systemName: "chevron.down")
                        .foregroundStyle(isEnabled ? .black : .gray.opacity(0.6))
                }
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
