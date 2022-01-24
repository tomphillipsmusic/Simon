//
//  SimonGame.swift
//  Simon
//
//  Created by Tom Phillips on 1/23/22.
//

import Foundation

class SimonGame: ObservableObject {
    @Published var buttons = [
        ButtonModel(buttonType: .green),
        ButtonModel(buttonType: .blue),
        ButtonModel(buttonType: .red),
        ButtonModel(buttonType: .yellow)
    ]
    
    @Published var sequence: [ButtonType]
    
    @Published var selectedIndex = 0
    
    @Published var turnOn = false
    @Published var isPlayingSequence = false
    
    init(numberOfStepsInSequence: Int = 1) {
        sequence = [ButtonType]()
        
        for _ in 0..<numberOfStepsInSequence {
            let step = SimonGame.ButtonType.allCases.randomElement()
            
            if let step = step {
                sequence.append(step)
            }
        }
    }
    
    enum ButtonType: String, CaseIterable {
        case green = "Green "
        case blue = "Blue "
        case red = "Red "
        case yellow = "Yellow "
    }
    
    var sequenceText: String {
        var text = ""
        
        for step in sequence {
            text.append(step.rawValue)
        }
        
        return text
    }
    
    func performSequence() {
        if selectedIndex == sequence.count {
            isPlayingSequence = false
            selectedIndex = 0
            turnOn = false
            return
        }
        
        let buttonIndex = buttons.firstIndex(where: {$0.buttonType == sequence[selectedIndex]})
        
        if let buttonIndex = buttonIndex {
            buttons[buttonIndex].isHighlighted.toggle()
            
            if turnOn {
                if selectedIndex < buttons.count {
                    selectedIndex += 1
                }
            }
            
            turnOn.toggle()
        }
        
    }
}
