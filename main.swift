//
//  main.swift
//  6I_KharitonovStepan
//
//  Created by Степан Харитонов on 11.10.2021.
//

import Foundation

// Домашнее задание к уроку №6

struct Queue <MyElements: Comparable> {
    var elements = [MyElements]()
    
    mutating func push(_ item: MyElements) {
                      elements.append(item)
                     }
    
    mutating func pop() {
                      elements.removeLast()
                     }
    
    mutating func SortArray() -> [MyElements] {
                      return elements.sorted(by: > )
                     }
    
    subscript(index: Int) -> MyElements? {
            get {
                 if index < elements.count{
                 return elements[index]
                 } else {
                 return nil
                }
           }
      }
}


var MyQueue = Queue<String>()
MyQueue.push("FFF")
MyQueue.push("AAA")
print(MyQueue)
var MyQueue1 = Queue<Int>()
MyQueue1.push(1)
MyQueue1.push(2)
MyQueue1.push(3)
MyQueue1.push(4)
print(MyQueue1)
print(MyQueue1[0]) // Тут фенкция ведёт себя корректно
print(MyQueue1[1]) // Но предупреждает о том, что
print(MyQueue1[2]) // Тип данных Int неявно переходит в
print(MyQueue1[3]) // типа данных Любой ^Any^
print(MyQueue1[4])
print(MyQueue[0])
print(MyQueue[1])
print(MyQueue[2])
var MyQueue2 = Queue<Int>()
MyQueue2.push(123)
MyQueue2.push(12)
MyQueue2.push(57)
MyQueue2.push(987)
print(MyQueue2.SortArray())
