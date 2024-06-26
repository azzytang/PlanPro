//
//  PlanProApp.swift
//  PlanPro
//
//  Created by Azalea Tang on 6/24/24.
//

import SwiftUI

@main
struct PlanProApp: App {
   
    var body: some Scene {
        WindowGroup {
            ContentView(task: .constant([Tasks(title: "", date: Date(), notes: "")]))
        }
    }
}
