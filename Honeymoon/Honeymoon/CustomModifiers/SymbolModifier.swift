//
//  SymbolModifier.swift
//  Honeymoon
//
//  Created by Saad Tahir on 29/05/2024.
//

import SwiftUI

struct SymbolModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 128))
            .foregroundStyle(.white)
            .shadow(color: Color(UIColor.white.withAlphaComponent(0.2)),
                    radius: 12,
                    x: 0,
                    y: 0)
    }
}
