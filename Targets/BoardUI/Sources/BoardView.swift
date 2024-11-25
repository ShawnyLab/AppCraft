//
//  BoardView.swift
//  BoardUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import BoardKit
import AppCraftCore
import ComposableArchitecture
import CompUI
import CompKit

public struct BoardView: View {
    private let boardStore: StoreOf<BoardFeature>
    private let compStore: StoreOf<CompFeature>
    
    @State private var showTypes = false
    @State private var editingType: SectorOptionType? = nil
    
    @State private var showCompListView = false
    
    public init(
        boardStore: StoreOf<BoardFeature>,
        compStore: StoreOf<CompFeature>
    ) {
        self.boardStore = boardStore
        self.compStore = compStore
    }

    public var body: some View {
        WithViewStore(self.boardStore, observe: { $0 }) { viewStore in
            ZStack {
                Color.white
                
                if let editingType {
                    Color.black.opacity(0.85)
                    .edgesIgnoringSafeArea(.all)
                    
                    switch editingType {
                    case .simpleText:
                        
                        
                        TextOptionView { sector in
                            viewStore.send(.addSector(sector))
                            self.editingType = nil
                        } cancel: {
                            self.editingType = nil
                        }

                    case .textWithDivider:
                        TextOptionView(withDivider: true) { sector in
                            viewStore.send(.addSector(sector))
                            self.editingType = nil
                        } cancel: {
                            self.editingType = nil
                        }

                    case .divider:
                        DividerOptionView { sector in
                            viewStore.send(.addSector(sector))
                            self.editingType = nil
                        } cancel: {
                            self.editingType = nil
                        }
                        
                    case .horizontal, .grid:
                        SelectCompView(store: compStore)

                    default:
                        VStack {
                            
                        }
                    }

                } else if showTypes {
                    SectorOptionView(showTypes: $showTypes, editingType: $editingType)
                } else {
                    ScrollView {
                        VStack {
                            ForEach(viewStore.sectors, id: \.id) { sector in
                                VStack {
                                    SectorView(cores: sector.cores)
                                }
                                .onAppear {
                                    print(sector.cores)
                                }
                            }
                            
                            
                            if !showTypes {
                                NewSectorButton(showTypes: $showTypes)
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BoardView(boardStore: Store(
        initialState: BoardFeature.State()
    ) {
        BoardFeature()
    }, compStore: Store(
        initialState: CompFeature.State()
    ) {
        CompFeature()
    }
    )
}
