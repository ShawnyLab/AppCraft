//
//  SingleBoardView.swift
//  AppCraft
//
//  Created by Shawn on 12/2/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI

struct SingleBoardView: View {
    var board: Board
    
    var body: some View {
        if board.id != "+" {
            Button {
                
            } label: {
                AppCraftCoreUIAsset
                    .darkGray
                    .swiftUIColor
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(
                        color: Color.black.opacity(0.25),
                        radius: 4,
                        x: 0,
                        y: 4
                    )
                    .overlay {
                        VStack(spacing: 0) {
                            AppCraftCoreUIAsset
                                .icBoardWhite
                                .swiftUIImage
                            
                            Text(board.name)
                                .font(ACFont.custom(20))
                                .foregroundStyle(Color.white)
                                .padding(.top, 25)
                        }

                    }
            }
        } else {
            Button {
                
            } label: {
                AppCraftCoreUIAsset
                    .gray2
                    .swiftUIColor
                    .aspectRatio(1.0, contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .shadow(
                        color: Color.black.opacity(0.25),
                        radius: 4,
                        x: 0,
                        y: 4
                    )
                    .overlay {
                        VStack(spacing: 0) {
                            Text("New Board")
                                .font(ACFont.custom(20))
                                .foregroundStyle(Color.white)
                                .padding(.top, 25)
                            
                            AppCraftCoreUIAsset
                                .icPlusWhite
                                .swiftUIImage
                        }

                    }
            }
        }
    }
}

#Preview {
    SingleBoardView(board: Board.mock)
}
