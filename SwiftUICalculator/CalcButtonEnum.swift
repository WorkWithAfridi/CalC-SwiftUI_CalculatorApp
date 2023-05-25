//
//  CalcButtonEnum.swift
//  SwiftUICalculator
//
//  Created by Khondakar Afridi on 25/5/23.
//

import Foundation
import SwiftUI

enum CalcButton : String{
    case One = "1"
    case Two = "2"
    case Three = "3"
    case Four = "4"
    case Five = "5"
    case Six = "6"
    case Seven = "7"
    case Eight = "8"
    case Nine = "9"
    case Zero = "0"
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multiply = "x"
    case Equal = "="
    case Clear = "AC"
    case Decimal = "."
    case Percent = "%"
    case Negative = "-/+"
    
    var buttonColor: Color{
        switch self{
        case .Add, .Subtract, .Multiply, .Divide, .Equal:
            return .purple
        case .Clear, .Negative, .Percent:
            return .pink
        default:
            return .orange
        }
    }
}
