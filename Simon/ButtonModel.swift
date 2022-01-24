//
//  ButtonModel.swift
//  Simon
//
//  Created by Tom Phillips on 1/23/22.
//

import Foundation
import SwiftUI

struct ButtonModel {
    var buttonType: SimonGame.ButtonType
    var isHighlighted = false
    
    var color: Color {
        switch buttonType {
        case .green:
            return .green
        case .blue:
            return .blue
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
}
