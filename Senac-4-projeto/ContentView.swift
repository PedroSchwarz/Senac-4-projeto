//
//  ContentView.swift
//  Senac-4-projeto
//
//  Created by Pedro Rodrigues on 30/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var appState = AppState()
    
    var body: some View {
        NavigationView {
            ZStack {
                switch appState.background {
                case .black:
                    Color.black
                        .ignoresSafeArea()
                case .white:
                    Color.white
                        .ignoresSafeArea()
                case .gray:
                    Color.gray
                        .ignoresSafeArea()
                }
                
                Text(appState.label)
                    .padding()
                    .foregroundColor(appState.background == .black || appState.background == .gray ? .white : .black)
                    .onTapGesture {
                        if isInStandByMode() {
                            appState.awakeFromStandByMode()
                        } else {
                            appState.switchState()
                        }
                    }
            }
            .navigationTitle("Switcher")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if !isInStandByMode() {
                            appState.goToStandByMode()
                        } else {
                            appState.awakeFromStandByMode()
                        }
                    } label: {
                        VStack {
                            Image(systemName: isInStandByMode() ? "poweron" : "powersleep")
                        }
                        .padding(isInStandByMode() ? 12 : 5)
                        .background(Circle().stroke(lineWidth: 1).fill(Color.accentColor))
                    }
                }
            }
        }
    }
    
    func isInStandByMode() -> Bool {
        return appState.background == .gray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
