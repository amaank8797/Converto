//
//  TemperatureCon.swift
//  Converto
//
//  Created by Amaan Amaan on 25/02/25.
//

import SwiftUI

struct TemperatureCon: View {
    let tempUnits: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    @State var initialSelectedtemp: String = "Celsius"
    @State var resultSelectedtemp: String = "Celsius"
    @State var initialTemp: Double = 0
    @FocusState private var tempIsFocused: Bool
    
    var totalTemperature : Double {
        switch (initialSelectedtemp, resultSelectedtemp) {
        case ("Celsius", "Fahrenheit"):
            return (initialTemp * 9/5) + 32
        case ("Celsius", "Kelvin"):
            return initialTemp + 273.15
        case ("Fahrenheit", "Celsius"):
            return (initialTemp - 32) * 5/9
        case ("Fahrenheit", "Kelvin"):
            return (initialTemp - 32) * 5/9 + 273.15
        case ("Kelvin", "Celsius"):
            return initialTemp - 273.15
        case ("Kelvin", "Fahrenheit"):
            return (initialTemp - 273.15) * 9/5 + 32
        default:
            return initialTemp
        }
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    Picker(selection: $initialSelectedtemp, label: Text("From")){
                        ForEach(tempUnits, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("enter value", value: $initialTemp, format: .number)
                        .keyboardType(.numberPad)
                        .focused($tempIsFocused)
                        
                    
                    
                }
                Section{
                    Picker(selection: $resultSelectedtemp, label: Text("To")){
                        ForEach(tempUnits, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Text("Result")
                    Text(totalTemperature , format: .number)
                    
                }
            }
            .navigationBarTitle("Temperature Converter")
          
            .toolbar {
                if tempIsFocused {
                    Button("Done") {
                        tempIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    TemperatureCon()
}
