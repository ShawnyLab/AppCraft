//
//  SectorOptionView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/11/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct SectorOptionView: View {
    @Binding var showTypes: Bool
    @Binding var editingType: SectorOptionType?
    private let types: [SectorOptionType] = SectorOptionType.allCases
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.85)
            
            VStack {
                Spacer()
                
                CraftCoreUIAsset.icSectorWhite30.swiftUIImage
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Choose the Sector")
                    .font(ACFont.custom(20))
                    .padding(.top, 15)
                
                Spacer()
                
                HStack(spacing: 50) {
                    VStack(spacing: 30) {
                        ForEach(types) { type in
                            Button {
                                withAnimation {
                                    editingType = type
                                    showTypes = false
                                }
                            } label: {
                                type.image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }
                        }
                    }
                                        
                    VStack(spacing: 30) {
                        ForEach(types) { type in
                            Button {
                                withAnimation {
                                    editingType = type
                                    showTypes = false
                                }
                            } label: {
                                Text(type.name)
                                    .frame(height: 30)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button {
                    withAnimation {
                        showTypes = false
                    }
                } label: {
                    Text("Cancel")
                        .foregroundStyle(ACColor.red)
                }
                
                Spacer()
                
            }
            .foregroundStyle(Color.white)
        }
        .ignoresSafeArea()

    }
}

#Preview {
    SectorOptionView(showTypes: .constant(true), editingType: .constant(nil))
}

extension SectorOptionType {
    var image: Image {
        switch self {
        case .simpleText:
            return CraftCoreUIAsset.icTextWhite.swiftUIImage
        case .image:
            return CraftCoreUIAsset.icImageWhite.swiftUIImage
        case .horizontal:
            return CraftCoreUIAsset.icHorizontalWhite.swiftUIImage
        case .grid:
            return CraftCoreUIAsset.icGridWhite.swiftUIImage
        case .divider:
            return CraftCoreUIAsset.icDividerWhite.swiftUIImage
        case .textWithDivider:
            return CraftCoreUIAsset.icTextDividerWhite.swiftUIImage
        case .emptySpace:
            return CraftCoreUIAsset.icSpaceWhite.swiftUIImage
        }
    }
}
