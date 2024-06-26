//
//  NewTask.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/25/24.
//

import SwiftUI

struct NewTask: View {
    @State public var title : String = ""
    @State public var date = Date()
    @State public var notes : String = ""
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
                
                NavigationLink(destination: TaskList()) {
                    Text("Create")
                }
                .foregroundColor(.white)
                .buttonStyle(.borderedProminent)
                .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                    }
                //TextField("Date", text: $date)
            


            }
        }
        
    }



#Preview {
    NewTask()
}
