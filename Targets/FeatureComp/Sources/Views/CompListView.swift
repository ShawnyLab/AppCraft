//
//  CompListView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import Shared
import CoreUI
import ComposableArchitecture

public struct CompListView: View {
    @State private var showCreateCompView = false
    
    private let store: StoreOf<FeatureComp>
    
    private var index = 0
    
    public init(store: StoreOf<FeatureComp>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                if viewStore.comps.count == 1 {
                    Button {
                         
                    } label: {
                        CompView(width: 165, comp: viewStore.comps[0])
                            .padding(.top, 50)
                    }
                } else if viewStore.comps.count == 2 {
                    
                } else if viewStore.comps.count > 2 {
                    GeometryReader { proxy in
                        let width = (proxy.size.width-40) / 2.5
                        
                        HStack(spacing: 0) {
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 50)
                }
                
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .padding(10)
                    }
                        
                    Button {
                        showCreateCompView = true
                    } label: {
                        VStack {
                            CoreUIAsset.icPlusWhite.swiftUIImage
                            
                            Text("Create One")
                                .font(ACFont.custom(13))
                        }
                        .padding(30)
                    }

                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .padding(10)
                    }
                }
                .padding(.top, 20)
                
            }
            .foregroundStyle(Color.white)
            .sheet(isPresented: $showCreateCompView) {
                let store = Store(
                    initialState: FeatureCreateComp.State()
                ) {
                    FeatureCreateComp()
                }
                
                CreateCompView(store: store)
            }
        }

    }
}

#Preview {
    CompListView(
        store: Store(
            initialState: FeatureComp.State()
        ) {
            FeatureComp()
        }
    )
    .background(Color.black)
}
