//
//  DetailedView.swift
//  NightWatchListView
//
//  Created by Thilagawathy Duraisamy on 28/4/2023.
//

import SwiftUI



struct DetailedView: View {
    @Binding var task: Task
    var body: some View {
        VStack {
            Text(task.name)
            Text("Placeholder for task description")
            Text("Placeholder for mark complete button")
            Button("Mark Complete", action: { task.isCompleted = true } )
            
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
        static var previews: some View {
            let task = Binding<Task>.constant(Task(name: "Test task", isCompleted: false, lastCompleted: nil))
            DetailedView(task: task)
    }
}

