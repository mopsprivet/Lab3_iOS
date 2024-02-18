print("Task 2: Task manager \n")

struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
}

var toDoList: [Task] = [
    Task(title: "iOS lab", description: "To do lab work number 3 on the subject 'iOS development'", isCompleted: true)
]


//инфа
func info() {
    print("\nTO-DO LIST: ")
    for task in toDoList {
        print(" Title: \(task.title) \n Description: \(task.description) \n Is completed: \(task.isCompleted) \n")
        }
    print("\n")
}


//добвление нового задания в список
func addTask() {
    print("Enter the information about the task you want to add: ")
        
        if let title_new = readLine(), let description_new = readLine(), let isCompleted_new = readLine(), let isCompleted_bool = Bool(isCompleted_new) {
            
            let newTask = Task(title: title_new, description: description_new, isCompleted: isCompleted_bool)
            
            toDoList.append(newTask)
            print("New task added!")
        } else {
            print("Invalid input. Task not added.")
        }
}
addTask()
info()


//удаление задач по названию
func deleteTask(taskToDelete: String){
    var taskIndex = 0
    
    for (i, task) in toDoList.enumerated() {
        if taskToDelete == task.title {
            taskIndex = i
        }
    }
    
    toDoList.remove(at: taskIndex)
}

//изменение статуса задач
func updateStatus(task: inout Task, newStatus: Bool) {
    task.isCompleted = newStatus
}

updateStatus(task: &toDoList[0], newStatus: true)
print("Updated task's status: ")
info()


//выполненные задания
func printCompletedTasks(tasks: [Task]) {
    print("Completed tasks:")
    for task in tasks {
        if task.isCompleted {
            print("- \(task.title)")
        }
    }
}
printCompletedTasks(tasks: toDoList)


//невыполненные задания
func printUnfulfilledTasks(tasks: [Task]) {
    print("Unfulfilled tasks:")
    for task in tasks {
        if task.isCompleted == false {
            print("- \(task.title)")
        }
    }
}
printUnfulfilledTasks(tasks: toDoList)


//удалить выполненные задания
func deleteCompletedTasks(tasks: inout [Task]) {
    tasks = tasks.filter { (task: Task) -> Bool in
        return !task.isCompleted
    }
}
deleteCompletedTasks(tasks: &toDoList)
info()



