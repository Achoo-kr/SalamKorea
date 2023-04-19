//
//  LoginScreenFeature.swift
//  SalamKorea
//
//  Created by 추현호 on 2023/04/19.
//

import Foundation
import ComposableArchitecture

struct LoginScreenFeature: ReducerProtocol {
    struct State: Equatable {
        var emailText: String = ""
        var passwordText: String = ""
        var errorMessage: String?
    }
    
    enum Action {
        case onEmailTextFieldChanged(text: String)
        case onPasswordTextFieldChanged(text: String)
        case onLoginButtonTapped
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case let .onEmailTextFieldChanged(text):
            state.emailText = text
            
            if !text.isEmpty {
                state.errorMessage = nil
            }
            
            return .none
            
        case let .onPasswordTextFieldChanged(text):
            state.passwordText = text
            
            if !text.isEmpty {
                state.errorMessage = nil
            }
            
            return .none
        
        case .onLoginButtonTapped:
            
            if state.emailText.isEmpty && state.passwordText.isEmpty {
                state.errorMessage = "Email and password should not be empty"
                return .none
            }
            
            if state.emailText.isEmpty {
                state.errorMessage = "Email should not be empty"
                return .none
            }
            
            if state.passwordText.isEmpty {
                state.errorMessage = "Password should not be empty"
                return .none
            }
            
            return .none
        }
    }
}
