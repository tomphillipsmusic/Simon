//
//  SimonButton.swift
//  Simon
//
//  Created by Tom Phillips on 1/23/22.
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
                Text(model.isHighlighted ? "*" : "")
                    .foregroundColor(.primary)
                    .font(.largeTitle)
            }
            
        }
        .padding(20)
    }
}
