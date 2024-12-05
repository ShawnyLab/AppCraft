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
                
                Button {
                    
                } label: {
                    HStack {
                        AppCraftCoreUIAsset
                            .icGoogle
                            .swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Spacer()
                        
                        Text("Sign in with Google")
                            .font(ACFont.custom(18))
                            .opacity(0.8)
                        
                        Spacer()
                        
                        Color.clear
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal)
                    .frame(height: 48)
                    .background(
                        Color.black
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal, 40)
                
                Button {
                    
                } label: {
                    HStack {
                        AppCraftCoreUIAsset
                            .icApple
                            .swiftUIImage
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Spacer()
                        
                        Text("Sign in with Apple")
                            .font(ACFont.custom(18))
                            .opacity(0.8)
                        
                        Spacer()
                        
                        Color.clear
                            .frame(width: 20, height: 20)
                    }
                    .padding(.horizontal)
                    .frame(height: 48)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(.horizontal, 40)
                .padding(.top, 10)
                
                // Error Message
                if let error = viewStore.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.white)
        }
    }
}


//#Preview {
//    SignInView()
//}
