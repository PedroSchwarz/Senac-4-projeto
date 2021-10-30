//
//  AppState.swift
//  Senac-4-projeto
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import Foundation

struct AppState {
    var background: Color = .black
    var label: String {
        switch background {
        case .black:
            return "Ligar"
        case .white:
            return "Desligar"
        case .gray:
            return "Acordar"
        }
    }
    
    enum Color {
        case black
        case white
        case gray
    }
    
    mutating func switchState() {
        background = background == .black ? .white : .black
    }
    
    mutating func goToStandByMode() {
        background = .gray
    }
    
    mutating func awakeFromStandByMode() {
        background = .white
    }
}
