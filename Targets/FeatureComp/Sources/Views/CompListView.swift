//
//  CompListView.swift
//  AppCraftUI
//
//  Created by Shawn on 11/21/24.
//

import SwiftUI
import Shared
import AppCraftCoreUI
import ComposableArchitecture
import DomainCompInterface

public struct CompListView: View {
    @State private var showCreateCompView = false
    
    private let store: StoreOf<FeatureComp>
    private let domain: DomainCompInterface
    
    private var index = 0
    
    public init(domainComp: DomainCompInterface) {
        self.store = Store(
            initialState: FeatureComp.State(), reducer: {
                FeatureComp(domainComp: domainComp)
            }
        )
        
        self.domain = domainComp
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
                            AppCraftCoreUIAsset.icPlusWhite.swiftUIImage
                            
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
                CreateCompView(store: Store(
                    initialState: FeatureCreateComp.State(), reducer: {
                        FeatureCreateComp(domainComp: domain)
                    }
                ))
            }
            .onAppear {
                viewStore.send(.fetchComps)
            }
        }

    }
}

//#Preview {
//    CompListView(
//        store: Store(
//            initialState: FeatureComp.State()
//        ) {
//            FeatureComp()
//        }
//    )
//    .background(Color.black)
//}
