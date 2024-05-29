//
//  HomeScreen.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HomeScreen: View {
    //MARK: - Properties
    @State var showAlert: Bool = false
    @State var showGuidView: Bool = false
    
    //MARK: - Views
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuidView)
            
            Spacer()
            
            DestinationCardView(destination: DestinationData[2])
            
            Spacer()
            
            FooterView(showAlert: $showAlert)
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing lovely and most precious of the times togather for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!!"))
            )
        }
    }
}

#Preview {
    HomeScreen()
}
