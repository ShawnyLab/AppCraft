//
//  SectorView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/18/24.
//

import SwiftUI
import AppCraftCore
import CraftCoreUI

struct SectorView: View {
    var cores: [any ACCoreType]
    
    var body: some View {
        if cores.isEmpty {
            HStack {
                Text("Wrong Sector!")
            }
        } else {
            CraftCoreView(cores: cores)
        }
    }
}

#Preview {
    SectorView(cores: [])
}
