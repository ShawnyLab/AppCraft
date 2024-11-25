//
//  CoreListView.swift
//  CraftCoreUI
//
//  Created by Shawn on 11/23/24.
//

import SwiftUI
import AppCraftCore

public struct CoreListView: View {
    var onSelect: (any ACCoreType) -> Void
    
    public init(onSelect: @escaping (any ACCoreType) -> Void) {
        self.onSelect = onSelect
    }
    
    public var body: some View {
        HStack(spacing: 30) {
            Spacer()
            
            VStack(spacing: 40) {
                ForEach(CoreOptionType.allCases) { option in
                    Button {
                         
                    } label: {
                        option.image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                    }
                }
            }

            VStack(spacing: 40) {
                ForEach(CoreOptionType.allCases) { option in
                    Button {
                        switch option {
                        case .text:
                            onSelect(ACText(content: "Text"))
                        case .image:
                            onSelect(ACImage(url: "url"))
                        case .space:
                            onSelect(ACBox())
                        }
                    } label: {
                        Text(option.name)
                            .font(ACFont.custom(20))
                            .frame(height: 30)
                    }
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 40)
        .foregroundStyle(Color.black)
        .background(Color.white)
    }
}

#Preview {
    CoreListView(onSelect: { _ in
        
    })
}
