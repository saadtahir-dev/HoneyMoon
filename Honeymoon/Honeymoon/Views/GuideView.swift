//
//  GuideView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 28/05/2024.
//

import SwiftUI

struct GuideView: View {
    //MARK: - Propeties
    @Environment(\.dismiss) var dismiss
    
    //MARK: - View
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination \nfor your honeymoon.")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack (alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subtitle: "Swipe Right",
                        description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favorites.",
                        icon: "heart.circle"
                    )
                    
                    GuideComponent(
                        title: "Dismiss",
                        subtitle: "Swipe Left",
                        description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                        icon: "xmark.circle"
                    )
                    
                    GuideComponent(
                        title: "Book",
                        subtitle: "Tap the Button",
                        description: "Our selection of honeymoon resorts is perfect setting for you to embark on your new life togather",
                        icon: "checkmark.square"
                    )
                    
                }
                
                Spacer(minLength: 10)
                
                Button {
                    print("Continue button tapped")
                    dismiss()
                } label: {
                    Text("Continue".uppercased())
                        .modifier(DismissButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    GuideView()
}
