//
//  TimeCon.swift
//  Converto
//
//  Created by Amaan Amaan on 02/03/25.
//

import SwiftUI

struct TimeCon: View {
    
    @State var initialSelectedtime: String = "minutes"
    @State var resultSelectedtime: String = "seconds"
    @State var initialTime: Double = 0
    @FocusState private var timeIsFocused: Bool
    
    let timeUnits: [String] = ["seconds", "minutes", "hours", "days"]

    var totalTime: Double {
        switch (initialSelectedtime, resultSelectedtime) {
        case ("seconds", "minutes"):
            return initialTime / 60
        case ("minutes", "seconds"):
            return initialTime * 60
        case ("seconds", "hours"):
            return initialTime / 3600
        case ("hours", "seconds"):
            return initialTime * 3600
        case ("seconds", "days"):
            return initialTime / 86400
        case ("days", "seconds"):
            return initialTime * 86400
        case ("minutes", "hours"):
            return initialTime / 60
        case ("hours", "minutes"):
            return initialTime * 60
        case ("minutes", "days"):
            return initialTime / 1440
        case ("days", "minutes"):
            return initialTime * 1440
        case ("hours", "days"):
            return initialTime / 24
        case ("days", "hours"):
            return initialTime * 24
        default:
            return initialTime
        }
    }

    
    var body: some View {
        
        NavigationStack{
            Form{
                Section{
                    Picker(selection: $initialSelectedtime, label: Text("From")){
                        ForEach(timeUnits, id: \.self){
                            Text($0)
                        }
                    }
                    TextField("enter value", value: $initialTime, format: .number)
                        .keyboardType(.numberPad)
                        .focused($timeIsFocused)
                        
                    
                    
                }
                Section{
                    Picker(selection: $resultSelectedtime, label: Text("To")){
                        ForEach(timeUnits, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Text("Result")
                    Text(totalTime , format: .number)
                    
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
    TimeCon()
}
