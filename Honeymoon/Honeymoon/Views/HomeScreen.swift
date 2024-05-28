//
//  HomeScreen.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            HeaderView()
            
            Spacer()
            
            DestinationCardView(destination: DestinationData[2])
            
            Spacer()
            
            FooterView()
        }
        .padding()
    }
}

#Preview {
    HomeScreen()
}
