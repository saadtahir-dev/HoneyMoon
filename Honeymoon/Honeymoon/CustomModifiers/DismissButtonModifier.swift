//
//  DismissButtonModifier.swift
//  Honeymoon
//
//  Created by Saad Tahir on 29/05/2024.
//

import SwiftUI

struct DismissButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundStyle(.white)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
            .background(
                Capsule()
                    .fill(.pink)
            )
    }
}
