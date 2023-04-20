//
//  LoginViewSnapshotTests.swift
//  SalamKoreaTests
//
//  Created by 추현호 on 2023/04/20.
//

import XCTest
import SnapshotTesting
import ComposableArchitecture
import SwiftUI
@testable import SalamKorea

final class LoginViewSnapshotTests: XCTestCase {
    
    func test_snapshot_shouldInitialState() {
        let store = Store(
            initialState: LoginScreenFeature.State(),
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let loginViewController = UIHostingController(rootView: loginView)
        
        assertSnapshot(matching: loginViewController, as: .image(on: .iPhone13))
    }
    
    func test_snapshot_shouldShowEmailTextOnNonEmptyEmail() {
        let store = Store(
            initialState: LoginScreenFeature.State(emailText: "any-email@mail.com"),
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let loginViewController = UIHostingController(rootView: loginView)
        
        assertSnapshot(matching: loginViewController, as: .image(on: .iPhone13))

    }
    
    func test_snapshot_shouldShowPasswordTextOnNonEmptyEmail() {
        let store = Store(
            initialState: LoginScreenFeature.State(passwordText: "any-password"),
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let loginViewController = UIHostingController(rootView: loginView)
        
        assertSnapshot(matching: loginViewController, as: .image(on: .iPhone13))

    }
}
