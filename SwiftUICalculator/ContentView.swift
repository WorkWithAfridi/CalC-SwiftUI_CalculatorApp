//
//  ContentView.swift
//  SwiftUICalculator
//
//  Created by Khondakar Afridi on 25/5/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var value = "0"
    @State var runnignNumber = 0
    @State var currentOperation : Operation = .none
    
    let buttons : [[CalcButton]] = [
        [.Clear, .Negative, .Percent, .Percent],
        [.Seven, .Eight, .Nine, .Multiply],
        [.Four, .Five, .Six, .Subtract],
        [.One, .Two, .Three, .Add],
        [.Zero, .Decimal, .Equal],
    ]
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text(value)
                        .bold()
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                }.padding()
                ForEach(buttons, id: \.self){
                    row in
                    HStack(spacing: 12){
                        ForEach(row, id: \.self){
                            item in
                            Button(action: {
                                self.didTap(button: item)
                            },
                                   label: {
                                Text(item.rawValue)
                                    .font(.system(size: 32))
                                    .frame(
                                        width: buttonWidth(item: item),
                                        height: buttonHeight()
                                    )
                                    .foregroundColor(.white)
                                    .background(item.buttonColor)
                                    .cornerRadius(
                                        buttonWidth(item: item)/2
                                    )
                            })
                        }
                    }.padding(.bottom, 3)
                }
            }
        }
    }
    
    func didTap(button: CalcButton){
        switch button{
        case .Add, .Subtract, .Multiply, .Divide, .Equal:
            if button == .Add{
                self.currentOperation = .add
                self.runnignNumber = Int(self.value) ?? 0
            } else if button == .Subtract{
                self.currentOperation = .subtract
                self.runnignNumber = Int(self.value) ?? 0
            } else if button == .Multiply{
                self.currentOperation = .multiply
                self.runnignNumber = Int(self.value) ?? 0
            } else if button == .Divide{
                self.currentOperation = .divide
                self.runnignNumber = Int(self.value) ?? 0
            } else if button == .Equal{
                let runningValue = self.runnignNumber
                let currentValue = Int(self.value) ?? 0
                switch self.currentOperation{
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .Equal{
                self.value="0"
            }
        case .Clear:
            self.value = "0"
        case .Decimal, .Negative, .Percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0"{
                value = number
            }else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
