//
//  LengthCon.swift
//  Converto
//
//  Created by Amaan Amaan on 02/03/25.
//

import SwiftUI

struct LengthCon: View {
    
    @State var initialSelectedlength: String = "kilometers"
    @State var resultSelectedlength: String = "meters"
    @State var initialLength: Double = 0
    @FocusState private var lengthIsFocused: Bool
    
    let lengthUnits: [String] = ["meters", "kilometers", "feet", "yards", "miles"]

    var totalLength: Double {
        switch (initialSelectedlength, resultSelectedlength) {
        case ("meters", "kilometers"):
            return initialLength / 1000
        case ("kilometers", "meters"):
            return initialLength * 1000
        case ("meters", "feet"):
            return initialLength * 3.28084
        case ("feet", "meters"):
            return initialLength / 3.28084
        case ("meters", "yards"):
            return initialLength * 1.09361
        case ("yards", "meters"):
            return initialLength / 1.09361
        case ("meters", "miles"):
            return initialLength * 0.000621371
        case ("miles", "meters"):
            return initialLength / 0.000621371
        case ("kilometers", "miles"):
            return initialLength * 0.621371
        case ("miles", "kilometers"):
            return initialLength / 0.621371
        case ("kilometers", "feet"):
            return initialLength * 3280.84
        case ("feet", "kilometers"):
            return initialLength / 3280.84
        case ("kilometers", "yards"):
            return initialLength * 1093.61
        case ("yards", "kilometers"):
            return initialLength / 1093.61
        case ("kilometers", "miles"):
            return initialLength * 0.621371
        case ("miles", "kilometers"):
            return initialLength / 0.621371
        case ("feet", "yards"):
            return initialLength / 3
        case ("yards", "feet"):
            return initialLength * 3
        case ("feet", "miles"):
            return initialLength / 5280
        case ("miles", "feet"):
            return initialLength * 5280
        case ("yards", "miles"):
            return initialLength / 1760
        case ("miles", "yards"):
            return initialLength * 1760
        default:
            return initialLength
        }
    }

    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker(selection: $initialSelectedlength, label: Text("From")){
                        ForEach(lengthUnits, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("enter value", value: $initialLength, format: .number)
                        .keyboardType(.numberPad)
                        .focused($lengthIsFocused)
                        
                    
                    
                }
                Section{
                    Picker(selection: $resultSelectedlength, label: Text("To")){
                        ForEach(lengthUnits, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Text("Result")
                    Text(totalLength , format: .number)
                    
                }
            }
            .navigationBarTitle("Length Converter")
          
            .toolbar {
                if lengthIsFocused {
                    Button("Done") {
                        lengthIsFocused = false
                    }
                }
            }
        }

    }
}

#Preview {
    LengthCon()
}
