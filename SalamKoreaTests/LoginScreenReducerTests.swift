//
//  LoginScreenReducerTests.swift
//  SalamKoreaTests
//
//  Created by 추현호 on 2023/04/19.
//

import ComposableArchitecture
import XCTest

struct LoginScreenFeature: ReducerProtocol {
    struct State: Equatable {
        var emailText: String = ""
        var passwordText: String = ""
    }
    
    enum Action {
        case onEmailTextFieldChanged(text: String)
        case onPasswordTextFieldChanged(text: String)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case let .onEmailTextFieldChanged(text):
            state.emailText = text
            return .none
            
        case let .onPasswordTextFieldChanged(text):
            state.passwordText = text
            return .none
        }
    }
}

final class LoginScreenReducerTests: XCTestCase {
    
    func test_onEmailTextFieldChanged_shouldSaveEmailState() {
        let typedText = "choo"
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onEmailTextFieldChanged(text: typedText)) { state in
            state.emailText = typedText
        }
    }
    
    func test_onPasswordTextFieldChanged_shouldSaveEmailState() {
        let typedText = "password"
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onPasswordTextFieldChanged(text: typedText)) { state in
            state.passwordText = typedText
        }
    }
}
