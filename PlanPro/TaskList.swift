//
//  TaskList.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/25/24.
//

import SwiftUI

struct Tasks: Identifiable {
    let title: String
    let date: Date
    let notes: String
    let id = UUID()
    var showTask : String{
        title + " " + notes
    }
}



struct TaskList: View {
    @Binding var task : [Tasks]
//    @State var task = [Tasks(title: "Finish assignment", date: "6/26", notes: "math homework pages 34-35 odds only")
//
//    ]
    @State private var multiSelection = Set<UUID>()
    var body: some View {
        
        ZStack {
//            List(0..<task.count) { index in
//                Text(self.task[index].title)
//            }
            Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                .ignoresSafeArea()
            VStack {
                
//
                NavigationView {
                            List(task, selection: $multiSelection) { task in
                                Text(task.title)
                            }
                            .navigationTitle("Tasks")
                            .toolbar { EditButton() }
                    
                }
               
                
                HStack {
                    NavigationLink(destination: CalendarView()) {
                        Text("See Calender")
                    }
                    .frame(width: nil)
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        }
                    NavigationLink(destination: ContentView(task: $task)) {
                        Text("Back")
                    }
                    .frame(width: nil)
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                        }
                
                    
                }
                   
                
                

            
        .navigationBarBackButtonHidden(true)
        }
    
    }


#Preview {
    TaskList(task: .constant([Tasks(title: "", date: Date(), notes: "")]))
}
