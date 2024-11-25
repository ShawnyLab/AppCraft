//
//  CompView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct CompView: View {
    var width: CGFloat = 160
    var comp: any CompType
    
    var body: some View {
        VStack {
            ACColor.darkGray
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .frame(width: width, height: width)
                .overlay(alignment: .topLeading) {
                    CraftCoreUIAsset
                        .icCompWhite
                        .swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 21)
                        .padding(10)
                }
                .overlay {
                    VStack {
                        CraftCoreView(cores: comp.thumbnail)
                            .padding([.horizontal, .top], 30)
                        
                        Text(comp.name)
                            .foregroundStyle(Color.white)
                    }
                }
                .background(
                    ACColor
                        .gray1
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(
                            color: Color.black.opacity(0.25),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                )
        }
    }
}

#Preview {
    CompView(comp: Comp(name: "Test",
                        thumbnail: [
                            ACColumn(cores: [
                                ACBox(width: -1, height: 30, color: "000000"),
                                ACRow(cores: [
                                    ACBox(width: -1, height: 20, color: "000000"),
                                    ACBox(width: 30, height: 20)
                                ])
                            ])
                        ]
                       )
    )
}
