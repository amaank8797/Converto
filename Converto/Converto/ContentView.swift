//
//  ContentView.swift
//  Converto
//
//  Created by Amaan Amaan on 25/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            
          
            
            VStack(spacing: 20){
                
                Text("Welcome to Converto")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .padding(.bottom, 50)
                
                
                NavigationLink("Temperature") {
                    TemperatureCon()
                }
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                NavigationLink("Length") {
                    LengthCon()
                }
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                NavigationLink("Time") {
                    TimeCon()
                }
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                NavigationLink("Volume") {
                    VolumeCon()
                }
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
