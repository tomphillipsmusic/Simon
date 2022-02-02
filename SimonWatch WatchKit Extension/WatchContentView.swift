//
//  ContentView.swift
//  SimonWatch WatchKit Extension
//
//  Created by Tom Phillips on 1/30/22.
//

import SwiftUI

struct WatchContentView: View {
    @ObservedObject var game: SimonGame
    
    var body: some View {
        ContentView(game: game)
    }
}

struct WatchContentView_Previews: PreviewProvider {
    static var previews: some View {
        WatchContentView(game: SimonGame(numberOfStepsInSequence: 4))
    }
}
