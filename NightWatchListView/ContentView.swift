//
//  ContentView.swift
//  NightWatchListView
//
//  Created by Thilagawathy Duraisamy on 5/4/2023.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var nightWatchTask: NightWatchTask
    @State private var focusOn = false
    @State private var resetTask = false
    
    var body: some View {
    
        NavigationView {
            List {
             
                Section(header: TaskSectionHeader(symbolSystemName: "moon.stars", headerText: "Nightly Task")) {
//                    Different way to create tuple
                    let index = nightWatchTask.nightTask.indices
//                    let indexValue = nightWatchTask.nightTask
//                    let taskIndexPair = Array(zip(index, indexValue))
//
                   //ForEach($nightWatchTask.nightTask) { $task in -> This works well
                   ForEach($nightWatchTask.nightTask, content:  { $task in
                    
//                        Old way of binding wrapper
                      let nightWatchWrapper  = $nightWatchTask
//                        let  bindingNightWatch = nightWatchWrapper.nightTask
//                        let bindingNightWatchTask = bindingNightWatch[0]
//
                        if focusOn == false || (focusOn && task.isCompleted == false){
                            
                            NavigationLink(destination: DetailedView(task: $task),
                                           label:{ TaskRow(task: task)} )}
                        
                   } ).onMove { IndexSet, to in
                       nightWatchTask.nightTask.move(fromOffsets: IndexSet, toOffset: to) }
                   .onDelete { IndexSet in
                       nightWatchTask.nightTask.remove(atOffsets: IndexSet) }
                }
                
                Toggle("focus", isOn: $focusOn)
               
                Section(header: TaskSectionHeader(symbolSystemName: "sun.haze", headerText: "Weekly Task")) {
                   ForEach($nightWatchTask.weeklyTask, content: {
                        $task in
                       if focusOn == false || (focusOn && task.isCompleted == false){
                           NavigationLink(destination: DetailedView(task: $task), label: {TaskRow(task: task)} )}

                   }).onDelete { IndexSet in
                       nightWatchTask.weeklyTask.remove(atOffsets: IndexSet) }
                }
                
                Section(header: TaskSectionHeader(symbolSystemName: "calendar", headerText: "Monthly Task")){
                    ForEach($nightWatchTask.monthlyTask,  content: {
                        $task in
                        if focusOn == false || (focusOn && task.isCompleted == false){
                            NavigationLink(destination: DetailedView(task: $task), label: {TaskRow(task: task)} )}
                }).onDelete { IndexSet in
                    nightWatchTask.monthlyTask.remove(atOffsets: IndexSet) }
                }
                
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton() } })
            .toolbar(content: {
                Button("Reset") {
                    
                    resetTask = true
                   
                }
            })
            .toolbar { ToolbarItem (placement: .bottomBar) {
                Toggle("focus", isOn: $focusOn) } }
            
        }.alert(Text("Alert"), isPresented: $resetTask) {
            
            Button(role: .destructive, action: {
                let resetNightWatchTask = NightWatchTask()
                self.nightWatchTask.nightTask = resetNightWatchTask.nightTask
                self.nightWatchTask.weeklyTask = resetNightWatchTask.weeklyTask
                self.nightWatchTask.monthlyTask = resetNightWatchTask.monthlyTask

            }, label: {
                Text("Are you sure")
            })
            Button(role: .cancel) {
                
            } label: {
                Text("cancel")
            }

        }
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName: String
    let headerText: String
    
    var body: some View {
        HStack {
            Text(Image(systemName: symbolSystemName))
            Text(headerText)
        }.foregroundColor(.blue)
            .font(.title3)
    }
}


struct TaskRow: View {
    let task: Task
    var body: some View {
        VStack {
            if task.isCompleted == true {
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name)
                        .foregroundColor(.gray)
                        .strikethrough()
                }
                
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
           }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         let nightWatchTask = NightWatchTask()
       
        ContentView(nightWatchTask: nightWatchTask)
        
    }
}


