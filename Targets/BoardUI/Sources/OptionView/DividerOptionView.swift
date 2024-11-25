//
//  DividerOptionView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct DividerOptionView: View {
    @State private var height: Double = 1
    
    @FocusState private var isFocused: Bool?
        
    var buttonHandler: (any SectorType) -> Void
    var cancel: () -> Void
    
    private var heightBinding: Binding<String> {
        Binding<String>(
            get: { String(format: "%.0f", height) },
            set: { newValue in
                if let value = Double(newValue.filter { "0123456789.".contains($0) }) {
                    height = value
                }
            }
        )
    }
    
    var body: some View {
        VStack {
            CraftCoreUIAsset
                .icDividerWhite
                .swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .opacity(0.8)
                .padding(.top, 100)
            
            Text("Enter the Height")
                .font(ACFont.custom(20))
                .padding(.top, 15)
                .opacity(0.8)
            
            Color.white.opacity(0.8)
                .frame(width: 100, height: height)
                .padding(.top, 15)
            
            HStack {
                TextField("Height", text: heightBinding)
                    .font(ACFont.custom(24))
                    .focused($isFocused, equals: true)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 30)
                    .keyboardType(.decimalPad)
            }

            
            Button {
                withAnimation {
                    //TODO: color
                    let sector = Sector(cores: [ACRow(cores: [ACBox(width: -1, height: height, color: "000000")])])
                    buttonHandler(sector)
                }
            } label: {
                Text("Next")
                    .foregroundStyle(ACColor.blue)
                    .padding(.vertical, 15)
            }
            
            Button {
                cancel()
            } label: {
                Text("Cancel")
                    .foregroundStyle(ACColor.red)
                    .padding(.vertical, 15)
            }
            
            Spacer()
        }
        .foregroundStyle(Color.white)
        .onAppear {
            isFocused = true
        }
    }
    
}


#Preview {
    DividerOptionView(buttonHandler: { sector in
        
    }, cancel: { })
    .background(Color.black)
}
