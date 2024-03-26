//
//  NightWatchListViewApp.swift
//  NightWatchListView
//
//  Created by Thilagawathy Duraisamy on 5/4/2023.
//

import SwiftUI

@main
struct NightWatchListViewApp: App {
    @StateObject private var nightWatchTask = NightWatchTask()
    var body: some Scene {
        WindowGroup {
            ContentView(nightWatchTask: nightWatchTask)
        }
    }
}
