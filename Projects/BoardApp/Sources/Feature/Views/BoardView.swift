//
//  BoardView.swift
//  BoardUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import Shared
//import FeatureComp
//import ComposableArchitecture

public struct BoardView: View {
//    private let boardStore: StoreOf<FeatureBoard>
//    private let compStore: StoreOf<FeatureComp>
//    
//    @State private var showTypes = false
//    @State private var editingType: SectorOptionType? = nil
//    
//    @State private var showCompListView = false
//    
//    public init(
//        boardStore: StoreOf<FeatureBoard>,
//        compStore: StoreOf<FeatureComp>
//    ) {
//        self.boardStore = boardStore
//        self.compStore = compStore
//    }

    public var body: some View {
        VStack {
            
        }
//        WithViewStore(self.boardStore, observe: { $0 }) { viewStore in
//            ZStack {
//                Color.white
//                
//                if let editingType {
//                    Color.black.opacity(0.85)
//                    .edgesIgnoringSafeArea(.all)
//                    
//                    switch editingType {
//                    case .simpleText:
//                        
//                        
//                        TextOptionView { sector in
//                            viewStore.send(.addSector(sector))
//                            self.editingType = nil
//                        } cancel: {
//                            self.editingType = nil
//                        }
//
//                    case .textWithDivider:
//                        TextOptionView(withDivider: true) { sector in
//                            viewStore.send(.addSector(sector))
//                            self.editingType = nil
//                        } cancel: {
//                            self.editingType = nil
//                        }
//
//                    case .divider:
//                        DividerOptionView { sector in
//                            viewStore.send(.addSector(sector))
//                            self.editingType = nil
//                        } cancel: {
//                            self.editingType = nil
//                        }
//                        
//                    case .horizontal, .grid:
//                        SelectCompView(store: compStore)
//
//                    default:
//                        VStack {
//                            
//                        }
//                    }
//
//                } else if showTypes {
//                    SectorOptionView(showTypes: $showTypes, editingType: $editingType)
//                } else {
//                    ScrollView {
//                        VStack {
//                            ForEach(viewStore.sectors, id: \.id) { sector in
//                                VStack {
//                                    SectorView(cores: sector.cores)
//                                }
//                                .onAppear {
//                                    print(sector.cores)
//                                }
//                            }
//                            
//                            
//                            if !showTypes {
//                                NewSectorButton(showTypes: $showTypes)
//                                .padding(.horizontal, 10)
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
}

//#Preview {
//    BoardView(boardStore: Store(
//        initialState: FeatureBoard.State()
//    ) {
//        FeatureBoard()
//    }, compStore: Store(
//        initialState: FeatureComp.State()
//    ) {
//        FeatureComp()
//    }
//    )
//}
