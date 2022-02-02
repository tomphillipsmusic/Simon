//
//  SimonApp.swift
//  SimonWatch WatchKit Extension
//
//  Created by Tom Phillips on 1/30/22.
//

import SwiftUI

@main
struct SimonApp: App {
    @StateObject var game = SimonGame(numberOfStepsInSequence: 4)
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                WatchContentView(game: game)
            }
        }
    }
}
