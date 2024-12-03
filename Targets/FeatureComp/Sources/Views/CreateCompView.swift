//
//  CreateCompView.swift
//  BoardUI
//
//  Created by Shawn on 11/22/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI
import ComposableArchitecture

public struct CreateCompView: View {
    let store: StoreOf<FeatureCreateComp>
    
    public init(store: StoreOf<FeatureCreateComp>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Button {
                        viewStore.send(.cancel)
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .frame(width: 50, height: 50)
                    
                    Spacer()
                    
                    Text("New Component")
                        .font(ACFont.custom(24, weight: .bold))
                    
                    Spacer()
                    
                    Button {
                        viewStore.send(.save)
                    } label: {
                        Image(systemName: "pencil")
                    }
                    .frame(width: 50, height: 50)
                }
                
                Text("This is Reusable Item")
                    .font(ACFont.custom(14))
                    .foregroundStyle(ACColor.gray1)
                
                EditCompView(
                    cores: viewStore.cores,
                    showCoreOptions: viewStore.binding(
                        get: \.showCoreOptions,
                        send: FeatureCreateComp.Action.toggleCoreOptions
                    ),
                    coreAddingPosition: viewStore.binding(
                        get: \.coreAddingPosition,
                        send: FeatureCreateComp.Action.updateCorePosition
                    ),
                    selectedRowId: viewStore.binding(
                        get: \.selectedRowId,
                        send: FeatureCreateComp.Action.updateSelectedRow
                    )
                )
                .padding(30)
                .background {
                    ACColor.darkGray
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(
                            color: Color.black.opacity(0.25),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                }
                .padding(50)
                
                Spacer()
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Done")
                            .font(ACFont.custom(24, weight: .bold))
                        
                        AppCraftCoreUIAsset
                            .icCompBlack
                            .swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                    .opacity(viewStore.isSaveable ? 1 : 0.3)
                }
                .disabled(!viewStore.isSaveable)
                
                Spacer()
            }
            .foregroundStyle(Color.black)
            .overlay {
                if viewStore.showCoreOptions {
                    ZStack {
                        Color.black.opacity(0.8)
                            .ignoresSafeArea()
                            .onTapGesture {
                                viewStore.send(.toggleCoreOptions(false))
                            }
                        
                        CoreListView(onSelect: { core in
                            if let position = viewStore.coreAddingPosition {
                                viewStore.send(.addCore(core, position: position))
                            }
                        })
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(50)
                    }
                }
            }
            .alert("Error", isPresented: viewStore.binding(
                get: { $0.error != nil },
                send: FeatureCreateComp.Action.clearError
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                if let error = viewStore.error {
                    Text(error)
                }
            }
        }
    }
}

//#Preview {
//    CreateCompView(
//        store: Store(
//            initialState: FeatureCreateComp.State()
//        ) {
//            FeatureCreateComp()
//        }
//    )
//}
