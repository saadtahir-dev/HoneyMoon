//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct GuideComponent: View {
    
    let title: String
    let subtitle: String
    let description: String
    let icon: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundStyle(.pink)
            
            VStack (alignment: .leading, spacing: 4) {
                HStack (alignment: .center) {
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
//                        .foregroundColor(.pink)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                
                Divider()
                    .padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    GuideComponent(title: "Title",
                   subtitle: "Subtitle",
                   description: "Placeholder texttext. Placeholder text. Placeholder texttext. Placeholder text. Placeholder texttext. Placeholder text. Placeholder texttext. Placeholder text. Placeholder texttext.",
                   icon: "xmark.circle")
}
