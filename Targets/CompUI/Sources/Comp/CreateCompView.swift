//
//  CreateCompView.swift
//  BoardUI
//
//  Created by Shawn on 11/22/24.
//

import SwiftUI
import CraftCoreUI
import AppCraftCore

struct CreateCompView: View {
    @State private var showCoreOptions = false
    @State private var cores: [any ACCoreType] = [ACColumn(cores: [])]
    @State private var coreAddingPosition: CoreAddingPosition? = nil
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                }
                .frame(width: 50, height: 50)
                
                Spacer()
                
                Text("New Component")
                    .font(ACFont.custom(24, weight: .bold))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                }
                .frame(width: 50, height: 50)
            }
            
            Text("This is Reusable Item")
                .font(ACFont.custom(14))
                .foregroundStyle(ACColor.gray1)
            
            EditCompView(cores: cores,
                         showCoreOptions: $showCoreOptions,
                         coreAddingPosition: $coreAddingPosition)
                .padding(50)
                .background {
                    ACColor.darkGray
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(
                            color: Color.black.opacity(0.25),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                }
                .padding(50)
            
            Spacer()
        }
        .foregroundStyle(Color.black)
        .overlay {
            if showCoreOptions {
                ZStack {
                    Color.black.opacity(0.8)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                showCoreOptions = false
                            }
                        }
                    
                    CoreListView(onSelect: { core in
                        guard let coreAddingPosition,
                              var column = cores[0] as? ACColumn else { return }
                        
                        switch coreAddingPosition {
                        case .left:
                            guard let rowIndex = UserDefaults.standard.value(forKey: "CurrentRowIndex") as? Int,
                                  var row = column.cores[rowIndex] as? ACRow else { return }
                            row.cores.insert(core, at: 0)
                            column.cores[rowIndex] = row
                            cores[0] = column
                        case .right:
                            guard let rowIndex = UserDefaults.standard.value(forKey: "CurrentRowIndex") as? Int,
                                  var row = column.cores[rowIndex] as? ACRow else { return }
                            row.cores.append(core)
                            column.cores[rowIndex] = row
                            cores[0] = column
                        case .down:
                            column.cores.append(ACRow(cores: [core]))
                            cores[0] = column
                        }
                        
                        showCoreOptions = false
                        self.coreAddingPosition = nil
                        // Clear the stored row index
                        UserDefaults.standard.removeObject(forKey: "CurrentRowIndex")
                    })
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(50)
                }
            }
        }
    }
}

#Preview {
    CreateCompView()
}
