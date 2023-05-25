//
//  ButtonDimentions.swift
//  SwiftUICalculator
//
//  Created by Khondakar Afridi on 25/5/23.
//

import Foundation
import UIKit

func buttonWidth(item: CalcButton)-> CGFloat{
    if item == .Zero{
        return (
            (UIScreen.main.bounds.width - (4*12))/4
        )*2
    }
    return (UIScreen.main.bounds.width - (5*12))/4
}

func buttonHeight()-> CGFloat{
    return (UIScreen.main.bounds.width - (5*12))/4
}
