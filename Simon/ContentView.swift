//
//  TimerTest.swift
//  Simon
//
//  Created by Tom Phillips on 1/23/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var game = SimonGame(numberOfStepsInSequence: 4)
    
    let timer = Timer.publish(every: 0.75, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("Score \(game.score)")
            Text(game.sequenceText)
            Text(game.guessString)
            Button("Play Sequence") {
                game.isPlayingSequence = true
            }
            HStack {
                SimonButton(model: $game.buttons[0], guessAction: game.guess)
                SimonButton(model: $game.buttons[1], guessAction: game.guess)
            }
            
            HStack {
                SimonButton(model: $game.buttons[2], guessAction: game.guess)
                SimonButton(model: $game.buttons[3], guessAction: game.guess)
            }
        }
            .onReceive(timer) { _ in
                if game.isPlayingSequence {
                    game.performSequence()
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
