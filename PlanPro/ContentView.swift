//
//  ContentView.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/24/24.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                    .ignoresSafeArea()
               
                VStack (spacing: 100) {
                    Text("PlanPro")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        
                    VStack (spacing: 30) {
                        NavigationLink(destination: NewTask()) {
                            Text("Create Task")
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        
                        
                        NavigationLink(destination: TaskList()) {
                            Text("View Tasks")
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        
                        NavigationLink(destination: Calendar()) {
                            Text("View Calendar")
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        
                    }
                        
                        
                }
                
            }
           
        }
       
        
    }
}

#Preview {
    ContentView()
}
