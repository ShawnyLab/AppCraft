//
//  BoardView.swift
//  BoardUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import Shared
import ComposableArchitecture
import AppCraftCoreUI

public struct BoardView: View {
    @State private var showTypes = false
    @State private var editingType: SectorOptionType? = nil
    
    @State private var showCompListView = false
    
    @Bindable private var store: StoreOf<FeatureCreateBoard>
    
    public init(
        store: StoreOf<FeatureCreateBoard>
    ) {
        self.store = store
    }

    public var body: some View {
        ZStack {
            Color.white
            VStack {
                HStack {
                    Button {
                        store.send(.cancel)
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    if store.isEditingTitle {
                        TextField("Board Title", text: Binding(
                            get: { store.title },
                            set: { store.send(.updateTitle($0)) }
                        ))
                        .font(ACFont.custom(24, weight: .bold))
                        .multilineTextAlignment(.center)
                    } else {
                        Text(store.title)
                            .font(ACFont.custom(24, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Button {
                        store.send(.toggleTitleEditing)
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .frame(width: 50, height: 50)
                }
                .foregroundStyle(Color.black)
                
                ScrollView {
                    VStack {
                        ForEach(store.sectors, id: \.id) { sector in
                            VStack {
                                SectorView(cores: sector.cores)
                            }
                        }
                        
                        NewSectorButton(showTypes: $showTypes)
                        .padding(.horizontal, 40)
                    }
                }
            }
            
            if let editingType {
                Color.black.opacity(0.85)
                .edgesIgnoringSafeArea(.all)
                
                switch editingType {
                case .simpleText:
                    
                    
                    TextOptionView { sector in
                        store.send(.addSector(sector))
                        self.editingType = nil
                    } cancel: {
                        self.editingType = nil
                    }

                case .textWithDivider:
                    TextOptionView(withDivider: true) { sector in
                        store.send(.addSector(sector))
                        self.editingType = nil
                    } cancel: {
                        self.editingType = nil
                    }

                case .divider:
                    DividerOptionView { sector in
                        store.send(.addSector(sector))
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
