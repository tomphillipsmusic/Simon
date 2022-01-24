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
    
    @State var turnOn = false
    @State var isPlayingSequence = false
    
    var body: some View {
        VStack {
            Text(game.sequenceText)
            Button("Play Sequence") {
                isPlayingSequence = true
            }
            HStack {
                SimonButton(model: $game.buttons[0])
                SimonButton(model: $game.buttons[1])
            }
            
            HStack {
                SimonButton(model: $game.buttons[2])
                SimonButton(model: $game.buttons[3])
            }
        }
            .onReceive(timer) { input in
                
                if isPlayingSequence {
                    if game.selectedIndex == game.sequence.count {
                        isPlayingSequence = false
                        game.selectedIndex = 0
                        turnOn = false
                        return
                    }
                    
                    let buttonIndex = game.buttons.firstIndex(where: {$0.buttonType == game.sequence[game.selectedIndex]})
                    
                    if let buttonIndex = buttonIndex {
                        game.buttons[buttonIndex].isHighlighted.toggle()
                        
                        if turnOn {
                            if game.selectedIndex < game.buttons.count {
                                game.selectedIndex += 1
                            }
                        }
                        
                        turnOn.toggle()
                    }
                    
                }
            }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
