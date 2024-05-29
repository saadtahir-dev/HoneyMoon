//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Saad Tahir on 29/05/2024.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(.pink)
    }
}
