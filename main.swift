//
//  main.swift
//  7I_KharitonovStepan
//
//  Created by Степан Харитонов on 17.10.2021.
//

import Foundation
 
// Задание №1

enum Errors: Error {
    case StudentNotIdentifier
}

class MethodError {
    let FullLesson: Int = 20 // Общее количество уроков
    fileprivate var DictionAbsence: [String : Int] = [
        "Селиванов Анатолий Иванович" : 4,
    ]
    func OutputAbsence (selection: String) -> Int? {
        return DictionAbsence[selection]
    }
    func DictApp (Name: String, Absence: Int) { // Добавляем прогульщика
        DictionAbsence[Name] = Absence
    }
    func DictDelete (Name: String) { // Удаляем прогульщика
        DictionAbsence[Name] = nil
    }
    func DictChange (Name: String) { // Увеличиваем значение прогулов для чела
        DictionAbsence[Name]! += 1
    }
    
    func Progress() -> String {
        guard DictionAbsence.count > 1 else {
            return "Учеников совсем не осталось"
        }
        var TotalProgress: Double = 100
        for i in DictionAbsence {
            TotalProgress -= (((Double(i.value)/(Double(FullLesson))/Double(DictionAbsence.count))*100))
        }
        return "Средняя успеваемость всех учеников \(TotalProgress) %."
    }
    
    func ProgressOneStudents(StudentName name: String) -> (Double?, Errors?) {
        guard let _ = DictionAbsence[name] else {
            return (nil, Errors.StudentNotIdentifier)
        }
        let NewProgress: Double = (100 -  ((Double(DictionAbsence[name]!)/Double(FullLesson))*100))
        return (NewProgress , nil)
    }
}
 
let St1 = MethodError()
St1.DictApp(Name: "Великодумов Андрей Валерьевич", Absence: 5)
St1.DictApp(Name: "Савельев Евгений Геннадьевич", Absence: 2)
St1.DictChange(Name: "Савельев Евгений Геннадьевич")
print(St1.DictionAbsence["Савельев Евгений Геннадьевич"]!)
print(St1.Progress())
print(St1.ProgressOneStudents(StudentName: "Антон"))
print(St1.ProgressOneStudents(StudentName: "Савельев Евгений Геннадьевич"))

// Задание №2

enum ProductionError: Error {
    case NoNameWorker
    case NoEmployee
    case NoNameCustomer
}

struct Worker {
    var AgeWorker: Int
    var SpecializationWorker: Specialization
    var AbilityToWork: Bool
}

struct Specialization {
    let Specname: String
}

class DictionWorker {
    var ListOfWorkers = [
        "Engineer": Worker(AgeWorker: 23, SpecializationWorker: Specialization(Specname: "Engineer") , AbilityToWork: true),
        "Electrican": Worker(AgeWorker: 19, SpecializationWorker: Specialization(Specname: "Electrican"), AbilityToWork: true),
        "Designer": Worker(AgeWorker: 21, SpecializationWorker: Specialization(Specname: "Designer"), AbilityToWork: false),
    ]
    
    func CallWork (NameWorker nameW: String) throws {
        guard let name = ListOfWorkers[nameW] else {
            throw ProductionError.NoNameWorker // существует ли такой работник
        }
        
        guard name.AbilityToWork == true else {
            throw ProductionError.NoEmployee // присутствует ли он на рабочем месте
        }
        
        var SomeWorker = name
        SomeWorker.AbilityToWork = false
        ListOfWorkers[nameW] = SomeWorker
        print("Работник \(nameW) вышел на задание.")
    }
}

let Customer = [
    "Air Factory": "Engineer",
    "Electrical Factory": "Electrican",
    "Design Burou": "Designer",
    "Super Factory": "Deployment"
]

func CallingEmployees(person: String, dictionWorker: DictionWorker) throws {
    guard let Custname = Customer[person] else {
        throw ProductionError.NoNameCustomer
    }
    
    return try dictionWorker.CallWork(NameWorker: Custname)
}

let dictionWorker = DictionWorker()

do {
    try CallingEmployees(person: "Air Factory", dictionWorker: dictionWorker)
} catch ProductionError.NoNameWorker {
    print ("Идентификатор работника не найден")
} catch ProductionError.NoEmployee {
    print ("Специалист в данный момент отсутствует")
} catch ProductionError.NoNameCustomer {
    print ("Идентификатор заказчика не найден")
}

do {
    try CallingEmployees(person: "Air Factory", dictionWorker: dictionWorker)
} catch ProductionError.NoNameWorker {
    print ("Идентификатор работника не найден")
} catch ProductionError.NoEmployee {
    print ("Специалист в данный момент отсутствует")
} catch ProductionError.NoNameCustomer {
    print ("Идентификатор заказчика не найден")
}

do {
    try CallingEmployees(person: "Super Factory", dictionWorker: dictionWorker)
} catch ProductionError.NoNameWorker {
    print ("Идентификатор работника не найден")
} catch ProductionError.NoEmployee {
    print ("Специалист в данный момент отсутствует")
} catch ProductionError.NoNameCustomer {
    print ("Идентификатор заказчика не найден")
}

do {
    try CallingEmployees(person: "Supe Factory", dictionWorker: dictionWorker)
} catch ProductionError.NoNameWorker {
    print ("Идентификатор работника не найден")
} catch ProductionError.NoEmployee {
    print ("Специалист в данный момент отсутствует")
} catch ProductionError.NoNameCustomer {
    print ("Идентификатор заказчика не найден")
}








