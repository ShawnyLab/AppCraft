//
//  CoreAuth.swift
//  CoreAuth
//
//  Created by Shawn on 11/27/24.
//

//import FirebaseAuth
//import Shared
//
//public actor CoreAuth: AuthService {
//    private let auth: Auth
//    
//    public init(
//        auth: Auth = Auth.auth()
//    ) {
//        self.auth = auth
//    }
//    
//    public var currentAccount: ACAccount? {
//        get async throws {
//            guard let firebaseUser = auth.currentUser else { return nil }
//            return ACAccount(userID: firebaseUser.uid, email: firebaseUser.email)
//        }
//    }
//    
//    public func signIn(email: String, password: String) async throws -> ACAccount {
//        do {
//            let result = try await auth.signIn(withEmail: email, password: password)
//            return ACAccount(userID: result.user.uid, email: result.user.email)
//        } catch {
//            throw AuthError.invalidCredentials
//        }
//    }
//    
//    public func signOut() throws {
//        do {
//            try auth.signOut()
//        } catch {
//            throw AuthError.unknown
//        }
//    }
//}
