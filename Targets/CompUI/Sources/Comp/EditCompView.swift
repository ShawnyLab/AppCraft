//
//  EditCompView.swift
//  CompUI
//
//  Created by Shawn on 11/23/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct EditCompView: View {
    var cores: [any ACCoreType]
    @Binding var showCoreOptions: Bool
    @Binding var coreAddingPosition: CoreAddingPosition?
    
    private var addButton: some View {
        Button {
            withAnimation {
                showCoreOptions = true
                coreAddingPosition = .down
            }
        } label: {
            CraftCoreUIAsset.plusCircleWhite.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30)
        }
        .frame(width: 50, height: 50)
    }
    
    private func createRowAddButton(position: CoreAddingPosition, row: ACRow) -> some View {
        Button {
            withAnimation {
                showCoreOptions = true
                coreAddingPosition = position
                
                // Save the current row reference for use in CoreListView
                if let columnIndex = cores.firstIndex(where: { $0 is ACColumn }),
                   var column = cores[columnIndex] as? ACColumn,
                   let rowIndex = column.cores.firstIndex(where: { $0.id == row.id }) {
                    UserDefaults.standard.set(rowIndex, forKey: "CurrentRowIndex")
                }
            }
        } label: {
            CraftCoreUIAsset.plusCircleWhite.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30)
        }
        .frame(width: 50, height: 50)
    }
    
    var body: some View {
        if !cores.isEmpty {
            VStack {
                ForEach(cores, id: \.id) { core in
                    if let core = core as? ACText {
                        Text(core.content)
                            .foregroundStyle(Color.black)
                    } else if let core = core as? ACBox {
                        if let color = core.color {
                            Color.black
                                .frame(width: CGFloat(core.width ?? 0) < 0 ? .infinity : CGFloat(core.width ?? 0),
                                       height: CGFloat(core.height ?? 0) < 0 ? .infinity : CGFloat(core.height ?? 0))
                        } else {
                            Color.clear
                                .frame(width: CGFloat(core.width ?? 0) < 0 ? .infinity : CGFloat(core.width ?? 0),
                                       height: CGFloat(core.height ?? 0) < 0 ? .infinity : CGFloat(core.height ?? 0))
                        }
                    } else if let core = core as? ACRow {
                        HStack {
                            createRowAddButton(position: .left, row: core)
                            EditCompView(cores: core.cores,
                                       showCoreOptions: $showCoreOptions,
                                       coreAddingPosition: $coreAddingPosition)
                            createRowAddButton(position: .right, row: core)
                        }
                    } else if let core = core as? ACColumn {
                        VStack {
                            EditCompView(cores: core.cores,
                                       showCoreOptions: $showCoreOptions,
                                       coreAddingPosition: $coreAddingPosition)
                            addButton
                        }
                    }
                }
                .foregroundStyle(Color.white)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        EditCompView(cores: [
            ACColumn(cores: [
                ACRow(cores: [ACText(content: "Test")]),
                ACRow(cores: [ACText(content: "Test2")])
            ])
        ], showCoreOptions: .constant(false), coreAddingPosition: .constant(nil))
        .foregroundStyle(Color.white)
    }
}
