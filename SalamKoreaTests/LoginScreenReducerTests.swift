//
//  LoginScreenReducerTests.swift
//  SalamKoreaTests
//
//  Created by 추현호 on 2023/04/19.
//

import ComposableArchitecture
import XCTest

struct LoginScreenFeature: ReducerProtocol {
    struct State {
        
    }
    
    enum Action {
        
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
            
        }
    }
}

final class LoginScreenReducerTests: XCTestCase {
    // 1단계 - intended failure - XCTFail
    func test_init_isInInitialState() {
        let store = TestStore(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature())
    }
}
