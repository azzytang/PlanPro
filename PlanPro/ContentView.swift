//
//  ContentView.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/24/24.
//


import SwiftUI

struct ContentView: View {
//    @Binding var task : Task
    @Binding var task : [Tasks]
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
                        NavigationLink(destination: NewTask( task: [Tasks(title: "", date: Date(), notes: "")])) {
                            Text("Create Task")
                        }
                        .foregroundColor(.white)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        
                        
                        NavigationLink(destination: TaskList(task: $task)) {
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
    ContentView(task: .constant([Tasks(title: "", date: Date(), notes: "")]))
}
