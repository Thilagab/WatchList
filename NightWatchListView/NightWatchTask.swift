//
//  NightWatchTask.swift
//  NightWatchListView
//
//  Created by Thilagawathy Duraisamy on 5/5/2023.
//

import Foundation

class NightWatchTask: ObservableObject {
    
   @Published var nightTask = [
        Task(name: " Check all windows", isCompleted: false, lastCompleted: nil),
        Task(name: " Check all doors", isCompleted: false, lastCompleted: nil),
        Task(name: " Check that the safe is locked", isCompleted: false, lastCompleted: nil),
        Task(name: " Check the mailbox", isCompleted: false, lastCompleted: nil),
        Task(name: " Inspect security cameras", isCompleted: false, lastCompleted: nil),
        Task(name: " Clear ice from sidewalks", isCompleted: false, lastCompleted: nil),
        Task(name: " Check all windows", isCompleted: false, lastCompleted: nil),
        Task(name: " Document \"Strange and unusual\" occurence", isCompleted: false, lastCompleted: nil)
    ]
    
   @Published var weeklyTask = [
        Task(name: " Check inside all vacant rooms", isCompleted: false, lastCompleted: nil),
        Task(name: " Walk the perimeter of property", isCompleted: false, lastCompleted: nil)
    ]
    
  @Published var monthlyTask = [
        Task(name: " Test security alarm", isCompleted: false, lastCompleted: nil),
        Task(name: " Test motion detectors", isCompleted: false, lastCompleted: nil),
        Task(name: " Test smoke alarms", isCompleted: false, lastCompleted: nil),
    ]
    
}
