//
//  Senac_4_projetoTests.swift
//  Senac-4-projetoTests
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import XCTest
@testable import Senac_4_projeto

class Senac_4_projetoTests: XCTestCase {
    
    func testAppStateInit() {
        let appState = AppState()
        
        XCTAssert(appState.background == .black)
        XCTAssert(appState.label == "Ligar")
    }
    
    func testAppStateFromBlackToWhite() {
        var appState = AppState()
        
        appState.switchState()
        
        XCTAssert(appState.background == .white)
        XCTAssert(appState.label == "Desligar")
    }
    
    func testAppStateFromWhiteToBlack() {
        var appState = AppState(background: .white)
        
        appState.switchState()
        
        XCTAssert(appState.background == .black)
        XCTAssert(appState.label == "Ligar")
    }
    
    func testAppStateFromOnToStandByMode() {
        var appState = AppState(background: .white)
        
        appState.goToStandByMode()
        
        XCTAssert(appState.background == .gray)
        XCTAssert(appState.label == "Acordar")
    }
    
    func testAppStateFromOffToStandByMode() {
        var appState = AppState()
        
        appState.goToStandByMode()
        
        XCTAssert(appState.background == .gray)
        XCTAssert(appState.label == "Acordar")
    }
    
    func testAppStateAwakeFromStandByMode() {
        var appState = AppState()
        
        appState.goToStandByMode()
        
        XCTAssert(appState.background == .gray)
        XCTAssert(appState.label == "Acordar")
        
        appState.awakeFromStandByMode()
        
        XCTAssert(appState.background == .white)
        XCTAssert(appState.label == "Desligar")
    }
}
