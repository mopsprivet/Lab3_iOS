//import UIKit

print("Task 1: Student Journal \n")

struct Student {
    let name: String
    let surname: String
    var averageGrade: Float
}

var StudentJournal: [Student] = [
    Student(name: "Name", surname: "Surname", averageGrade: 88.7),
    Student(name: "Кракорябра", surname: "Зелибоба", averageGrade: 90.1)
]

//добвление нового студента в массив
func addStudent(newStudent: Student) {
    StudentJournal.append(newStudent)
}

//удаление студентов по нейм сёрнейм
func deleteStudent(){
    print("Enter name and surname to delete student: ")
    
    let name = readLine()
    let surname = readLine()
    
    var studIndex = 0
    
    for (i, student) in StudentJournal.enumerated() {
        if name == student.name && surname == student.surname {
            studIndex = i
        }
    }
    
    StudentJournal.remove(at: studIndex)
}


//вывод инфы о студентах
func info() {
    print("\nSTUDENTS: ")
    for student in StudentJournal {
        print(" Name: \(student.name) \n Surname: \(student.surname) \n Average Grade: \(student.averageGrade) \n")
        }
    print("\n")
}

var student1 = Student(name: "New", surname: "Student", averageGrade: 79.1)
var student2 = Student(name: "Anastasiya", surname: "Sitchenko", averageGrade: 88.2)

addStudent(newStudent: student1)
addStudent(newStudent: student2)


//средний балл по убыванию
func averageGradeDesc() {
    let n = StudentJournal.count
    
    for i in 0..<n {
        for j in 0..<(n-i-1) {
            if StudentJournal[j].averageGrade < StudentJournal[j+1].averageGrade {
                StudentJournal.swapAt(j, j+1)
            }
        }
    }
    
    info()
}

//средний балл по всем студентам
func averageGradeAllStudents() -> Float {
    var average: Float = 0.0
    let n = StudentJournal.count
    
    for i in 0..<n {
        average += StudentJournal[i].averageGrade
    }
    
    return average/Float(n)
}



//максимальный средний балл
func maxGrade() {
    var maxGrade: Float = 0.0
    var index = 0
    
    for i in 0..<StudentJournal.count {
        if StudentJournal[i].averageGrade > maxGrade {
            maxGrade = StudentJournal[i].averageGrade
            index = i
        }
    }
    
    print("Student with the highest average grade: \(StudentJournal[index].name) \(StudentJournal[index].surname), \(StudentJournal[index].averageGrade)")
}


print("Information about all students: ")
info()

print("Average grade of students in descending order: ")
averageGradeDesc()

print("Average grade among all students: \(averageGradeAllStudents())")
maxGrade()


deleteStudent()
print("Information about students after deletion: ")
info()



