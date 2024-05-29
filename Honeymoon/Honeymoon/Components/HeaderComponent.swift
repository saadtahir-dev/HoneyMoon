//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HeaderComponent: View {
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Capsule()
                .foregroundStyle(.secondary)
                .frame(width: 120, height: 6)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
        }
    }
}

#Preview {
    HeaderComponent()
}
