//
//  EditCompView.swift
//  CompUI
//
//  Created by Shawn on 11/23/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI

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
            AppCraftCoreUIAsset
                .plusCircleWhite
                .swiftUIImage
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
            AppCraftCoreUIAsset.plusCircleWhite.swiftUIImage
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
                .font(ACFont.custom(12))
        } else if let core = core as? ACBox {
            if let color = core.color {
                AppCraftCoreUIAsset
                    .gray3
                    .swiftUIColor
                    .frame(width: CGFloat(core.width ?? 0) < 0 ? .infinity : CGFloat(core.width ?? 0),
                           height: CGFloat(core.height ?? 0) < 0 ? .infinity : CGFloat(core.height ?? 0))
            } else {
                Color.clear
                    .frame(width: CGFloat(core.width ?? 0) < 0 ? .infinity : CGFloat(core.width ?? 0),
                           height: CGFloat(core.height ?? 0) < 0 ? .infinity : CGFloat(core.height ?? 0))
            }
        } else if let core = core as? ACRow {
            HStack {
                if core.cores.count < 3 {
                    createRowAddButton(position: .left, row: core)
                    renderCores(core.cores, isRow: true)
                    createRowAddButton(position: .right, row: core)
                } else {
                    renderCores(core.cores, isRow: true)
                }
            }
        } else if let core = core as? ACColumn {
            VStack {
                renderCores(core.cores)
                addButton
            }
        } else if let core = core as? ACImage {
            AppCraftCoreUIAsset
                .gray3
                .swiftUIColor
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
    
    var body: some View {
        if !cores.isEmpty {
            renderCores(cores)
        }
    }
}
