//
//  ContentView.swift
//  toDoMobile
//
//  Created by StudentAM on 2/27/24.
//

import SwiftUI                        // Import SwiftUI framework

struct ContentView: View {           // Define ContentView as a SwiftUI view
    @State var newTask : String = "" // State variable to hold new task input
    @State var tasks: [String] = []  // State variable to hold list of tasks
    @State var tasksCount: Int = 0   // State variable to hold count of tasks
    @State var showToast: Bool = false // State variable to control showing toast
    
    var body: some View {             // Define the view's body
        VStack {                      // Vertical stack container
            Text("To-Do List")        // Display title text
                .font(.title)         // Set font size
                .padding()            // Add padding
            Text("Number of Tasks: \(tasks.count)") // Display count of tasks
                .padding(.top, 20)   // Add padding to top
            
            TextField("Enter a new task you need to complete", text: $newTask) // Text field for new task input
                .textFieldStyle(RoundedBorderTextFieldStyle())  // Apply rounded border style
                .padding()            // Add padding
                
                .alert(isPresented: $showToast) { // Show alert if showToast is true
                    Alert(title: Text("Error"), message: Text("Please enter a task"), dismissButton: .default(Text("OK")))
                }
        }
        
        HStack{                      // Horizontal stack container
            
            Button(action: addTask) { // Button to add task
                Text("Add Task")     // Display button text
            }
            .padding()                // Add padding
            .background(newTask.isEmpty ? Color.gray : Color.blue) // Set background color based on newTask
            .foregroundColor(.white) // Set text color
            .cornerRadius(8)         // Set corner radius
            
            Button(action: removeAllTasks) { // Button to clear all tasks
                Text("Clear all")     // Display button text
            }
            .padding()                // Add padding
            .background(tasks.isEmpty ? Color.gray : Color.blue) // Set background color based on tasks
            .foregroundColor(.white) // Set text color
            .cornerRadius(8)         // Set corner radius
        }
        
        
        List{                         // List container
            
            ForEach(tasks, id: \.self) { task in // Loop through tasks
                Text("\(task)")       // Display task
            }
            .onDelete(perform: deleteTask) // Allow deleting tasks on swipe
        }
    }
    
    func deleteTask(offset : IndexSet){ // Function to delete task
        tasks.remove(atOffsets: offset)  // Remove task at given offsets
    }
    
    func removeAllTasks() {             // Function to remove all tasks
        tasks.removeAll()               // Remove all tasks from the list
    }
    
    func addTask() {                    // Function to add task
        if !newTask.isEmpty {           // Check if newTask is not empty
            tasks.append(newTask)       // Add newTask to tasks list
            newTask = ""                // Reset newTask
        }
        else {                          // If newTask is empty
            showToast = true            // Set showToast to true to show alert
        }
    }
}

#Preview{                             // Preview the ContentView
    ContentView()                     // Display ContentView
}
