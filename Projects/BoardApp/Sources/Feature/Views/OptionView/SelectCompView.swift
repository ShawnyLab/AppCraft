//
//  SelectCompView.swift
//  BoardUI
//
//  Created by Shawn on 11/22/24.
//

import SwiftUI
import AppCraftCoreUI
import ComposableArchitecture

struct SelectCompView: View {
    var body: some View {
        VStack {
            AppCraftCoreUIAsset
                .icHorizontalWhite
                .swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .opacity(0.8)
                .padding(.top, 100)
            
            Text("Choose your Component")
                .font(ACFont.custom(20))
                .padding(.top, 15)
                .opacity(0.8)
            
            
//            CompListView(store: store)
            
            Button {

            } label: {
                Text("Cancel")
                    .foregroundStyle(ACColor.red)
            }
            .padding(.top, 50)
            
            Spacer()
        }
        .foregroundStyle(Color.white)
    }
}
