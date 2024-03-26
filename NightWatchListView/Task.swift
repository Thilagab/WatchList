//
//  Task.swift
//  NightWatchListView
//
//  Created by Thilagawathy Duraisamy on 2/5/2023.
//

import Foundation

struct Task: Identifiable {
    
    let name: String
    let id = UUID()
    var isCompleted: Bool
    var lastCompleted: Date?
}
