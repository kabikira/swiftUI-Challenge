//
//  ContentView.swift
//  swiftUI-Challenge1
//
//  Created by koala panda on 2023/01/04.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    let unitConversions =  ["m", "km", "ft", "yd", "mil"]

    var inputConversion: Double {
        switch inputUnit {
        case unitConversions[0]:
            return inputValue
        case unitConversions[1]:
            return inputValue * 1000
        case unitConversions[2]:
            return (inputValue / 3.281)
        case unitConversions[3]:
            return  (inputValue / 1.094)
        case unitConversions[4]:
            return  (inputValue * 1609)
        default:
            return 0.0
        }
    }
    func outputConversion(input: Double) -> Double {
        switch outputUnit {
        case unitConversions[0]:
            return input
        case unitConversions[1]:
            return input / 1000
        case unitConversions[2]:
            return input * 3.281
        case unitConversions[3]:
            return input * 1.094
        case unitConversions[4]:
            return input / 1609
        default:
            return 0.0
        }
    }
 
    @FocusState private var amountIsFocused: Bool
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter a numerical value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("unitConversions", selection: $inputUnit) {
                        ForEach(unitConversions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Value")
                }
                Section {
                    Text(outputConversion(input:inputConversion), format: .number)
                    Picker("unitConversions", selection: $outputUnit) {
                        ForEach(unitConversions, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Converted value")
                }
            }
            .navigationTitle("Length transformation")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
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
