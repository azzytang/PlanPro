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
    
    var body: some View {
        ZStack {
            Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                .ignoresSafeArea()
            VStack {
                Text("Tasks")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                HStack {
                    Table(task) {
                        TableColumn("Title", value: \.title )
//                        TableColumn("Notes", value: \.notes)
                        
                   }
                    
                    
                }
                
                NavigationLink(destination: Calendar()) {
                    Text("See Calender")
                }
                .frame(width: nil)
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                    }

            }
        }
    }


#Preview {
    TaskList(task: .constant([Tasks(title: "", date: Date(), notes: "")]))
}
