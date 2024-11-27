//
//  SignInView.swift
//  FeatureAuth
//
//  Created by Shawn on 11/27/24.
//

import SwiftUI
import ComposableArchitecture

public struct SignInView: View {
    private let store: StoreOf<FeatureAuth>
    
    public init(store: StoreOf<FeatureAuth> = Store(initialState: FeatureAuth.State()) {
        FeatureAuth()
    }) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 20) {
                // Title
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                
                // Email Field
                TextField("Email", text: viewStore.binding(
                    get: \.email,
                    send: { .updateEmail($0) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .keyboardType(.emailAddress)
                .padding(.horizontal)
                
                // Password Field
                SecureField("Password", text: viewStore.binding(
                    get: \.password,
                    send: { .updatePassword($0) }
                ))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                
                // Sign In Button
                Button {
                    viewStore.send(.signIn)
                } label: {
                    if viewStore.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    } else {
                        Text("Sign In")
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)
                .disabled(viewStore.isLoading)
                
                // OAuth Buttons
                HStack(spacing: 20) {
                    // Google Sign In
                    Button {
                        // Test implementation
                        viewStore.send(.signIn)
                    } label: {
                        HStack {
                            Image(systemName: "g.circle.fill")
                            Text("Google")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                    // Apple Sign In
                    Button {
                        // Test implementation
                        viewStore.send(.signIn)
                    } label: {
                        HStack {
                            Image(systemName: "apple.logo")
                            Text("Apple")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Error Message
                if let error = viewStore.error {
                    Text(error.localizedDescription)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
            }
            .padding()
            .onAppear {
                viewStore.send(.checkAuthenticationStatus)
            }
            // Success 상태를 보여주기 위한 테스트용 오버레이
            .overlay {
                if viewStore.isAuthenticated {
                    VStack {
                        Text("Successfully signed in! 🎉")
                            .font(.title2)
                            .padding()
                        
                        if let user = viewStore.currentUser {
                            Text("Welcome, \(user.email)")
                                .padding()
                        }
                        
                        Button("Sign Out") {
                            viewStore.send(.signOut)
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                }
            }
        }
    }
}


#Preview {
    SignInView()
}
