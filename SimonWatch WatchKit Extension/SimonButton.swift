//
//  SimonButton.swift
//  SimonWatch WatchKit Extension
//
//  Created by Tom Phillips on 1/30/22.
//

import SwiftUI

struct SimonButton: View {
    @Binding var model: ButtonModel
    var guessAction: (ButtonModel) -> Void
    
    var body: some View {
        Button(action: {
            guessAction(model)
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(model.color)
                    .shadow(radius: 10)
                    .brightness(model.isHighlighted ? 0.3 : 0)
            }
            
        }
    }
}

struct SimonButton_Previews: PreviewProvider {
    static var previews: some View {
        SimonButton(model: .constant(ButtonModel(buttonType: .green)), guessAction: SimonGame().guess)
    }
}
