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
    }
    
    enum Action {
        case onEmailTextFieldChanged(text: String)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        case let .onEmailTextFieldChanged(text):
            state.emailText = text
            return .none
        }
    }
}

final class LoginScreenReducerTests: XCTestCase {
    
    func test_onEmailTextFieldChanged_shouldSaveEmailState() {
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        
        store.send(.onEmailTextFieldChanged(text: "choo")) { state in
            state.emailText = "choo"
        }
    }
}
