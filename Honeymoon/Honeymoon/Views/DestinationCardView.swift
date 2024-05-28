//
//  DestinationCardView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct DestinationCardView: View {
    
    let id = UUID()
    let destination: Destination
    
    var body: some View {
        Image(destination.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(24)
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack {
                    Text(destination.place)
                        .foregroundStyle(.white)
                        .font(.custom("AvenirNext-bold", fixedSize: 32))
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundStyle(.white),
                            alignment: .bottom
                        )
                    
                    Text(destination.country)
                        .frame(minWidth: 85)
                        .foregroundStyle(.black)
                        .font(.custom("AvenirNext-medium", fixedSize: 16))
                        .shadow(radius: 1)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule()
                                .foregroundStyle(.white)
                        )
                }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50),
                    alignment: .bottom
                
            )
        
    }
}

#Preview {
    DestinationCardView(destination: DestinationData[1])
}
