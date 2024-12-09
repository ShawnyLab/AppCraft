//
//  DefaultView.swift
//  FeatureMain
//
//  Created by Shawn on 12/8/24.
//

import SwiftUI
import DomainBoard
import BoardRepository
import CoreDatabase
import ComposableArchitecture

public struct DefaultView: View {
    @State private var showMainView = false
    
    public init() { }
    
    public var body: some View {
        VStack {
            if showMainView {
                let database = CoreDatabase()
                let boardRepository: BoardRepositoryInterface = BoardRepository(database: database)
                
                MainTabBarView(store: StoreOf<FeatureMain>(initialState: FeatureMain.State(), reducer: {
                    FeatureMain()
                }), domainBoard: DomainBoard(repository: boardRepository))
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
