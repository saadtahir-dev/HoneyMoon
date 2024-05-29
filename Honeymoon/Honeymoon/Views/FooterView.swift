//
//  FooterView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct FooterView: View {
    //MARK: - PROPERTIES
    @Binding var showAlert: Bool
    
    
    private let haptics = UINotificationFeedbackGenerator()
    
    //MARK: - Views
    var body: some View {
        HStack (alignment: .center) {
            Button {
                print("Info")
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 42))
                    .tint(.primary)
            }

            Spacer()
            
            Button {
                print("Sucess")
                haptics.notificationOccurred(.success)
                PlaySound.shared.play(sound: "sound-click", type: "mp3")
                showAlert.toggle()
            } label: {
                Text("Book Destination".uppercased())
                    .tint(.pink)
                    .font(.system(.headline, design: .rounded))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(
                        Capsule()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.pink)
                    )
            }
            
            
            Spacer()
            
            Button {
                print("Info")
            } label: {
                Image(systemName: "heart.circle")
                    .font(.system(size: 42))
                    .tint(.primary)
            }
        }
    }
}

#Preview {
    FooterView(
        showAlert: .init(
            get: {
                false
            }, set: { _ in
            })
    )
}
