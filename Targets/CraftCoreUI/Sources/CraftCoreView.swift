//
//  CraftCoreView.swift
//  CraftCoreUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import AppCraftCore

public struct CraftCoreView: View {
    public var cores: [any ACCoreType]
    
    public init(cores: [any ACCoreType]) {
        self.cores = cores
    }
    
    public var body: some View {
        if let core = cores[0] as? ACRow {
            HStack {
                CraftCoreView(cores: core.cores)
            }
        } else if let core = cores[0] as? ACColumn {
            VStack {
                CraftCoreView(cores: core.cores)
            }
        } else {
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
                        CraftCoreView(cores: core.cores)
                    }
                } else if let core = core as? ACColumn {
                    VStack {
                        CraftCoreView(cores: core.cores)
                    }
                }
            }
        }
    }
}
