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
        let sut = makeSUT(initialState: LoginScreenFeature.State())
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))
    }
    
    func test_snapshot_shouldShowEmailTextOnNonEmptyEmail() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(emailText: "any-email@mail.com"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))

    }
    
    func test_snapshot_shouldShowPasswordTextOnNonEmptyEmail() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(passwordText: "any-password"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))

    }
    
    func test_snapshot_shouldShiwErrorMessage() {
        let sut = makeSUT(initialState: LoginScreenFeature.State(errorMessage: "any error message"))
        
        assertSnapshot(matching: sut, as: .image(on: .iPhone13))
    }
    
    //MARK: - Helpers
    
    private func makeSUT(initialState: LoginScreenFeature.State) -> UIViewController {
        let store = Store(
            initialState: initialState,
            reducer: LoginScreenFeature()
        )
        let loginView = LoginView(store: store)
        let sut = UIHostingController(rootView: loginView)
        return sut
    }
}
