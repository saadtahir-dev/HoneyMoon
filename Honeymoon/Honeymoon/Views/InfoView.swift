//
//  InfoView.swift
//  Honeymoon
//
//  Created by Saad Tahir on 29/05/2024.
//

import SwiftUI

struct InfoView: View {
    //MARK: - Properties
    @Environment(\.dismiss) var dismiss
    
    
    //MARK: View
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                HeaderComponent()
                
                Spacer()
                
                appInfo
                
                Spacer()
                
                creditsView
                
                Spacer()
                
                Button {
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
    
    @ViewBuilder
    var appInfo: some View {
        Text("App Info")
            .fontWeight(.black)
            .modifier(TitleModifier())
        
        VStack(alignment: .leading, spacing: 10) {
            rowView(itemOne: "Application", itemTwo: "Honeymoon")
            rowView(itemOne: "Compatibility", itemTwo: "iPhone/iPad")
            rowView(itemOne: "Developer", itemTwo: "Saad Tahir")
            rowView(itemOne: "Designmer", itemTwo: "Robert Petras")
            rowView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
    
    @ViewBuilder
    var creditsView: some View {
        Text("Credits")
            .fontWeight(.black)
            .modifier(TitleModifier())
        
        VStack(alignment: .leading, spacing: 10) {
            rowView(itemOne: "Photos", itemTwo: "Unsplash")
            rowView(itemOne: "Photographers", itemTwo: "")
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .font(.footnote)
                .multilineTextAlignment(.leading)
            
        }
    }
    
    @ViewBuilder
    func rowView(itemOne: String, itemTwo: String) -> some View {
        HStack {
            Text(itemOne)
                .foregroundStyle(.gray)
            Spacer()
            Text(itemTwo)
        }
        Divider()
    }
}

#Preview {
    InfoView()
}
