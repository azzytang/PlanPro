//
//  CalendarView.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/27/24.
//


import SwiftUI



struct CalendarDay: Identifiable {
    let id = UUID()
    let date: Date
    var tasks: [Tasks]
}
class CalendarViewModel: ObservableObject {
    @Published var days: [CalendarDay] = []
    
    init(task: [Tasks]) {
        loadTasks(task: task)
    }
    
    func loadTasks(task: [Tasks]) {
        let calendar = Calendar.current
        var tempDays: [CalendarDay] = []
        
        // Assume you have a method to fetch tasks
        let tasks = task
        
        // Create dates for a month (for simplicity, using the current month)
        let today = Date()
        let range = calendar.range(of: .day, in: .month, for: today)!
        for day in range {
            let date = calendar.date(byAdding: .day, value: day - 1, to: today.startOfMonth)!
            let dayTasks = tasks.filter { calendar.isDate($0.date, inSameDayAs: date) }
            let calendarDay = CalendarDay(date: date, tasks: dayTasks)
            tempDays.append(calendarDay)
        }
        
        days = tempDays
    }
    
   
}

extension Date {
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }
}


    
struct CalView: View {
    let days: [CalendarDay]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(days) { day in
                    CalendarDayView(day: day)
                }
            }
        }
    }
}
    
struct CalendarDayView: View {
    let day: CalendarDay
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
           VStack {
               Spacer()
               HStack {
                  ForEach(day.tasks) { _ in
                      Circle()
                          .fill(.white)
                          .frame(width: 6, height: 6)  // Small dot for each task
                  }
              }
           }
           Text("\(Calendar.current.component(.day, from: day.date))")
               .font(.subheadline)  // Smaller font size
               .padding(8)  // Padding for better spacing
               .foregroundColor(.white)
       }
        .frame(width: 40, height: 40)
        .padding(6)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
struct CalendarView: View {
   
    @Binding var task : [Tasks]
    @StateObject private var viewModel : CalendarViewModel
    init(task: Binding<[Tasks]>) {
         self._task = task
         self._viewModel = StateObject(wrappedValue: CalendarViewModel(task: task.wrappedValue))
     }
     
    var body: some View {
        ZStack {
            Color(red: 232.0/255.0, green: 197.0/255.0, blue: 202.0/255.0)
                .ignoresSafeArea()
            NavigationStack {
                VStack {
                    Text("June")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("2024")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    CalView(days: viewModel.days)
                        .padding()
                    NavigationLink(destination: NewTask( task: task)) {
                        Text("Create Task")
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                    
                    NavigationLink(destination: ContentView(task: $task)) {
                        Text("Back")
                    }
                    .foregroundColor(.white)
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 211.0/255.0, green: 173.0/255.0, blue: 181.0/255.0))
                  
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        
        
    }
}



#Preview {
    CalendarView(task: .constant([Tasks(title: "", date: Date(), notes: "")]))
}
