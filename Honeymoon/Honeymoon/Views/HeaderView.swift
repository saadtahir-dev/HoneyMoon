//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct HeaderView: View {
    //MARK: - Properties
    @Binding var showInfoView: Bool
    @Binding var showGuideView: Bool
    
    private let haptics = UINotificationFeedbackGenerator()
    
    //MARK: - View
    var body: some View {
        HStack (alignment: .center) {
            Button {
                print("Info")
                haptics.notificationOccurred(.success)
                PlaySound.shared.play(sound: "sound-click", type: "mp3")
                showInfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24))
                    .tint(.primary)
            }
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }

            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                print("GuideView")
                haptics.notificationOccurred(.success)
                PlaySound.shared.play(sound: "sound-click", type: "mp3")
                showGuideView.toggle()
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
        showInfoView: .init(
            get: {
                false
            }, set: { _ in
            }), 
        showGuideView: .init(
            get: {
                false
            }, set: { _ in
            })
    )
}
