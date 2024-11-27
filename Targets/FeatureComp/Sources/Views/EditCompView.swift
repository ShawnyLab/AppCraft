//
//  EditCompView.swift
//  CompUI
//
//  Created by Shawn on 11/23/24.
//

import SwiftUI
import Shared
import CoreUI

struct EditCompView: View {
    var cores: [any ACCoreType]
    @Binding var showCoreOptions: Bool
    @Binding var coreAddingPosition: CoreAddingPosition?
    @Binding var selectedRowId: UUID?
    
    private var addButton: some View {
        Button {
            withAnimation {
                showCoreOptions = true
                coreAddingPosition = .down
                selectedRowId = nil
            }
        } label: {
            CoreUIAsset.plusCircleWhite.swiftUIImage
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
                selectedRowId = row.id
            }
        } label: {
            CoreUIAsset.plusCircleWhite.swiftUIImage
                .resizable()
                .frame(width: 30, height: 30)
        }
        .frame(width: 50, height: 50)
    }
    
    private func renderCores(_ cores: [any ACCoreType], isRow: Bool = false) -> some View {
        Group {
            if isRow {
                HStack {
                    ForEach(cores, id: \.id) { core in
                        renderCore(core)
                    }
                }
            } else {
                VStack {
                    ForEach(cores, id: \.id) { core in
                        renderCore(core)
                    }
                }
            }
        }
        .foregroundStyle(Color.white)
    }
    
    @ViewBuilder
    private func renderCore(_ core: any ACCoreType) -> some View {
        if let core = core as? ACText {
            Text(core.content)
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
                renderCores(core.cores, isRow: true)
                createRowAddButton(position: .right, row: core)
            }
        } else if let core = core as? ACColumn {
            VStack {
                renderCores(core.cores)
                addButton
            }
        }
    }
    
    var body: some View {
        if !cores.isEmpty {
            renderCores(cores)
        }
    }
}

#Preview {
    ZStack {
        Color.gray
            .ignoresSafeArea()
        EditCompView(cores: [
            ACColumn(cores: [
                ACRow(cores: [ACText(content: "Test"), ACText(content: "Test1")]),
                ACRow(cores: [ACText(content: "Test2"), ACText(content: "Test3")])
            ])
        ], showCoreOptions: .constant(false),
           coreAddingPosition: .constant(nil),
           selectedRowId: .constant(nil))
        .foregroundStyle(Color.white)
    }
}
