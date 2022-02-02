//
//  SimonApp.swift
//  Simon
//
//  Created by Tom Phillips on 1/23/22.
//

import SwiftUI

@main
struct SimonApp: App {
    @StateObject var game = SimonGame(numberOfStepsInSequence: 4)
    
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
