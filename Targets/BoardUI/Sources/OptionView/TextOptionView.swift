//
//  TextOptionView.swift
//
//  Created by Shawn on 11/12/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct TextOptionView: View {
    @State private var text: String = ""
    @FocusState private var isFocused: Bool?
    
    @State private var showPositions = false
    @State private var selectedPosition: ACPosition = .center
    
    var withDivider: Bool = false
    var buttonHandler: (any SectorType) -> Void
    var cancel: () -> Void
    
    enum ACPosition: String, Identifiable, CaseIterable {
        public var id: String {
            self.rawValue
        }
        
        case left, center, right
        
        var image: Image {
            switch self {
            case .center:
                CraftCoreUIAsset.icPositionCenterWhite.swiftUIImage
            case .left:
                CraftCoreUIAsset.icPositionLeftWhite.swiftUIImage
            case .right:
                CraftCoreUIAsset.icPositionRightWhite.swiftUIImage
            }
        }
    }
    
    var body: some View {
        VStack {
            if withDivider {
                CraftCoreUIAsset
                    .icTextDividerWhite
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .opacity(0.8)
                    .padding(.top, 100)
            } else {
                CraftCoreUIAsset
                    .icTextWhite
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .opacity(0.8)
                    .padding(.top, 100)
            }
            
            if !showPositions {
                Text("Enter your Text")
                    .font(ACFont.custom(20))
                    .padding(.top, 15)
                    .opacity(0.8)
            }

            Color.white.opacity(withDivider ? 0 : 0.8)
                .frame(width: 100, height: 1)
                .padding(.top, 15)
            
            if !showPositions {
                TextField("Title...", text: $text)
                    .font(ACFont.custom(24))
                    .focused($isFocused, equals: true)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 30)
                
                Button {
                    withAnimation {
                        showPositions = true
                    }
                } label: {
                    Text("Next")
                        .foregroundStyle(ACColor.blue)
                        .padding(.vertical, 15)
                }
                
                Button {
                    
                } label: {
                    Text("Cancel")
                        .foregroundStyle(ACColor.red)
                        .padding(.vertical, 15)
                }
            } else {
                if !withDivider {
                    HStack {
                        if selectedPosition == .right {
                            Spacer()
                        }
                        
                        Text(text)
                            .font(ACFont.custom(24))
                            .padding(.vertical, 30)
                        
                        if selectedPosition == .left {
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 50)
                } else {
                    HStack {
                        if selectedPosition == .right || selectedPosition == .center {
                            Color.white
                                .frame(height: 1)
                        }
                        
                        Text(text)
                            .font(ACFont.custom(24))
                            .padding(.vertical, 30)
                        
                        if selectedPosition == .left || selectedPosition == .center {
                            Color.white
                                .frame(height: 1)
                        }
                    }
                    .padding(.horizontal, 50)
                }

                HStack {
                    ForEach(ACPosition.allCases) { position in
                        Button {
                            withAnimation {
                                selectedPosition = position
                            }
                        } label: {
                            position.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .opacity(selectedPosition == position ? 1 : 0.35)
                        }
                        
                        if position != .right {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal, 50)
                .padding(.vertical, 20)
                
                Button {
                    withAnimation {
                        var row = ACRow(cores: [])

                        if withDivider {
                            switch selectedPosition {
                            case .center:
                                row.cores = [ACText(content: text)]
                            case .left:
                                row.cores = [ACText(content: text), ACBox(width: -1, height: 1, color: "000000")]
                            case .right:
                                row.cores = [ACBox(width: -1, height: 1, color: "000000"), ACText(content: text)]
                            }
                        } else {
                            switch selectedPosition {
                            case .center:
                                row.cores = [ACText(content: text)]
                            case .left:
                                row.cores = [ACText(content: text), ACBox(width: -1, height: 1, color: nil)]
                            case .right:
                                row.cores = [ACBox(width: -1, height: 1, color: nil), ACText(content: text)]
                            }
                        }
                        
                        buttonHandler(Sector(cores: [row]))
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
    TextOptionView(buttonHandler: { sector in
        
    }, cancel: { })
    .background(Color.black)
}
