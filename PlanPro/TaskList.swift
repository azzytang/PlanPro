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
    private let dateFormatter: DateFormatter = {
               let formatter = DateFormatter()
               formatter.dateStyle = .medium
               formatter.timeStyle = .short
               return formatter
           }()
    @State private var multiSelection = Set<UUID>()
//    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(.accentColor)]
//    }
    var body: some View {
        
        ZStack {
            Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                .ignoresSafeArea()
            
    
            VStack {
                Text("Tasks")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding()
                NavigationView {
                            List(task, selection: $multiSelection) { task in
                                Text(task.title + " | " + dateFormatter.string(from: task.date))
                            }
                            .background(Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0))

                            .scrollContentBackground(.hidden)
                            .navigationTitle("")
                            
                            
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
