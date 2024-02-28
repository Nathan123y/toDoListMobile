//
//  ContentView.swift
//  toDoMobile
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State var newTask : String = ""
    @State var tasks: [String] = []
    @State var tasksCount: Int = 0
    @State var showToast: Bool = false
    
    var body: some View {
        VStack {
            Text("To-Do List")
                .font(.title)
                .padding()
            Text("Number of Tasks: \(tasks.count)")
                .padding(.top, 20)
            
            TextField("Enter a new task you need to complete", text: $newTask)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
                .alert(isPresented: $showToast) {
                    Alert(title: Text("Error"), message: Text("Please enter a task"), dismissButton: .default(Text("OK")))
                }
        }
        
        HStack{
            
            Button(action: addTask) {
                Text("Add Task")
            }
            .padding()
            .background(newTask.isEmpty ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Button(action: removeAllTasks) {
                Text("Clear all")
            }
            .padding()
            .background(tasks.isEmpty ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        
        
        List{
            
            ForEach(tasks, id: \.self) { task in
                Text("\(task)")
            }
            .onDelete(perform: deleteTask)
            
        }
        
    }
    func deleteTask(offset : IndexSet){
        tasks.remove(atOffsets: offset)
    }
    
    func removeAllTasks() {
        tasks.removeAll()
        
    }
    
    func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
            
        }
        else {
            showToast = true
        }
        
    }
    
    
}
#Preview{
    ContentView()
}
