//
//  DefaultView.swift
//  AppCraft
//
//  Created by Shawn on 12/5/24.
//

import SwiftUI
import DomainBoard
import BoardRepository
import CoreDatabase

struct DefaultView: View {
    @State private var showMainView = false
    
    
    var body: some View {
        VStack {
            if showMainView {
                let database = CoreDatabase()
                let boardRepository: BoardRepositoryInterface = BoardRepository(database: database)
                
                MainTabBarView(domainBoard: DomainBoard(repository: boardRepository))
            }
        }
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                showMainView = true
            }
        }
    }
}
