//
//  VolumeCon.swift
//  Converto
//
//  Created by Amaan Amaan on 02/03/25.
//

import SwiftUI

struct VolumeCon: View {

    @State var initialSelectedvolume: String = "liters"
    @State var resultSelectedvolume: String = "milliliters"
    @State var initialVolume: Double = 0
    @FocusState private var timeIsFocused: Bool
    
    let volumeUnits: [String] = ["milliliters", "liters", "cups", "pints", "gallons"]

    var totalVolume: Double {
        switch (initialSelectedvolume, resultSelectedvolume) {
        case ("milliliters", "liters"):
            return initialVolume / 1000
        case ("liters", "milliliters"):
            return initialVolume * 1000
        case ("milliliters", "cups"):
            return initialVolume / 240
        case ("cups", "milliliters"):
            return initialVolume * 240
        case ("milliliters", "pints"):
            return initialVolume / 473.176
        case ("pints", "milliliters"):
            return initialVolume * 473.176
        case ("milliliters", "gallons"):
            return initialVolume / 3785.41
        case ("gallons", "milliliters"):
            return initialVolume * 3785.41
        case ("liters", "cups"):
            return initialVolume * 4.16667
        case ("cups", "liters"):
            return initialVolume / 4.16667
        case ("liters", "pints"):
            return initialVolume * 2.11338
        case ("pints", "liters"):
            return initialVolume / 2.11338
        case ("liters", "gallons"):
            return initialVolume / 3.78541
        case ("gallons", "liters"):
            return initialVolume * 3.78541
        case ("cups", "pints"):
            return initialVolume / 2
        case ("pints", "cups"):
            return initialVolume * 2
        case ("cups", "gallons"):
            return initialVolume / 16
        case ("gallons", "cups"):
            return initialVolume * 16
        case ("pints", "gallons"):
            return initialVolume / 8
        case ("gallons", "pints"):
            return initialVolume * 8
        default:
            return initialVolume
        }
    }

    
    
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    Picker(selection: $initialSelectedvolume, label: Text("From")){
                        ForEach(volumeUnits, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("enter value", value: $initialVolume, format: .number)
                        .keyboardType(.numberPad)
                        .focused($timeIsFocused)
                        
                    
                    
                }
                Section{
                    Picker(selection: $resultSelectedvolume, label: Text("To")){
                        ForEach(volumeUnits, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Text("Result")
                    Text(totalVolume , format: .number)
                    
                }
            }
            .navigationBarTitle("Temperature Converter")
          
            .toolbar {
                if timeIsFocused {
                    Button("Done") {
                        timeIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    VolumeCon()
}
