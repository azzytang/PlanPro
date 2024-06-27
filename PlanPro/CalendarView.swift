//
//  CalendarView.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/27/24.
//

import SwiftUI
import UIKit

import ElegantCalendar

struct CalendarView: View {
    @ObservedObject var calendarManager = ElegantCalendarManager(
        configuration: CalendarConfiguration(startDate: Date(),
                                             endDate: Date()))

    var body: some View {
        ElegantCalendarView(calendarManager: calendarManager)

        
        
    }
}
#Preview {
    CalendarView()
}
