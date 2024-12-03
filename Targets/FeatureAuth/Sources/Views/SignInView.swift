//
//  SignInView.swift
//  FeatureAuth
//
//  Created by Shawn on 11/27/24.
//

import SwiftUI
import AppCraftCoreUI
import ComposableArchitecture
import AuthenticationServices
import DomainAuthInterface

public struct SignInView: View {
    private let store: StoreOf<FeatureAuth>
    
    public init(domainAuth: DomainAuthInterface) {
        let featureAuth = FeatureAuth(auth: domainAuth)
        self.store = Store(initialState: FeatureAuth.State(), reducer: {
            featureAuth
        })
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Join AppCraft")
                        .font(ACFont.custom(32, weight: .bold))
                        .foregroundStyle(Color.black)
                    
                    Spacer()
                }

                AppCraftCoreUIAsset
                    .guideLogo
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .padding(.vertical, 40)
                    .padding(.bottom, 20)
                
                AppCraftCoreUIAsset
                    .googleSignin
                    .swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 50)
                
                SignInWithAppleButton { request in
                    //TODO: signin
                } onCompletion: { result in
                    
                }
                .scaledToFit()
                .padding(.horizontal, 50)
                
                // Error Message
                if let error = viewStore.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
    }
}


//#Preview {
//    SignInView()
//}
