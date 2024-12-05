//
//  BoardView.swift
//  BoardUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import Shared
import ComposableArchitecture

public struct BoardView: View {
    @State private var showTypes = false
    @State private var editingType: SectorOptionType? = nil
    
    @State private var showCompListView = false
    
    private let store: StoreOf<FeatureCreateBoard>
    
    public init(
        store: StoreOf<FeatureCreateBoard>
    ) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            ZStack {
                Color.white
                
                ScrollView {
                    VStack {
                        ForEach(viewStore.sectors, id: \.id) { sector in
                            VStack {
                                SectorView(cores: sector.cores)
                            }
                        }
                        
                        NewSectorButton(showTypes: $showTypes)
                        .padding(.horizontal, 30)
                    }
                }

                
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
                        SelectCompView()

                    default:
                        VStack {
                            
                        }
                    }

                } else if showTypes {
                    SectorOptionView(showTypes: $showTypes, editingType: $editingType)
                }
                
            }
        }
    }
}
