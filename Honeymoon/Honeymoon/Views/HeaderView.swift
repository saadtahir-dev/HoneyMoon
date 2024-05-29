//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
    @Binding var showGuideView: Bool
    
    //MARK: - View
    var body: some View {
        HStack (alignment: .center) {
            Button {
                print("Info")
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24))
                    .tint(.primary)
            }

            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                print("GuideView")
                print(showGuideView)
                showGuideView = true
                print("after toggle: \(showGuideView)")
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24))
                    .tint(.primary)
            }
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }
        }
    }
}

#Preview {
    HeaderView(
        showGuideView: .init(
            get: {
                false
            }, set: { _ in
            })
    )
}
