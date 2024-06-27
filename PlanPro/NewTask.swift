//
//  NewTask.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/25/24.
//

import SwiftUI


struct NewTask: View {
    @State private var title : String = ""
    @State private var date = Date()
    @State private var notes : String = ""
    //@State private var time : String = ""
//    public struct CustomTextFieldStyle : TextFieldStyle {
//            public func _body(configuration: TextField<Self._Label>) -> some View {
//                configuration
//                    .font(.largeTitle) // set the inner Text Field Font
//                    .padding(10) // Set the inner Text Field Padding
//                    //Give it some style
//                    .background(
//                        RoundedRectangle(cornerRadius: 5)
//                            .strokeBorder(Color.primary.opacity(0.5), lineWidth: 3))
//                    .background()
//            }
//        }
//    public struct CustomDatePickerStyle : DatePickerStyle {
//            public func _body(configuration: DatePicker<Self._Label>) -> some View {
//                configuration
//                    .font(.largeTitle) // set the inner Text Field Font
//                    .padding(10) // Set the inner Text Field Padding
//                    //Give it some style
//                    .background(
//                        RoundedRectangle(cornerRadius: 5)
//                            .strokeBorder(Color.primary.opacity(0.5), lineWidth: 3))
//                    .background()
//            }
//        }
    @State var task : [Tasks]
   
    var body: some View {
        ZStack {
            Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                .ignoresSafeArea()
            
            VStack {
                Text("Create New Task")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                
                TextField("Title", text: $title)
                    .frame(width: 350.0, height: 25.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                DatePicker(selection: $date, label: { /*@START_MENU_TOKEN@*/Text("Date")/*@END_MENU_TOKEN@*/ })
                    .frame(width: 350.0, height: 25.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
                TextField("Notes", text: $notes)
                    .frame(width: 350.0, height: 25.0)
                    .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.white/*@END_MENU_TOKEN@*/)
            }
            
            HStack {
                Button("Save Task") {
                    if task[0].title == "" {
                        task = [Tasks(title: title, date: date, notes: notes)]
                    } else {
                        task.append(Tasks(title: title, date: date, notes: notes))
                    }
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 206.0/255.0, green: 185.0/255.0, blue: 190.0/255.0))
                .opacity(0.8)
                
                
                NavigationLink(destination: TaskList(task: $task)) {
                    Text("Go to Task List")
                    
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                
            
                
                NavigationLink(destination: ContentView(task: $task)) {
                    Text("Back")
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
              
                
               
                
            }
            .padding(.top, 500.0)
        }
        }
       
       
    }



#Preview {
    NewTask(task: [Tasks(title: "", date: Date(), notes: "")])
}
