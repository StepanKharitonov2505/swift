//
//  main.swift
//  2I_1_KharitonovStepan
//
//  Created by Степан Харитонов on 26.09.2021.
//

import Foundation

// Домашнее задание №1

func Evennaya (Number: Int) -> () {
    if Number % 2 == 0 {
        print("Число \(Number) четное")
    } else {
        print("Число \(Number) не четное")
    }
}

var a : Int = 12
Evennaya(Number: a)

// Домашнее задание №2

func DivisionBy3 (NumberDivision: Int) -> () {
    if NumberDivision % 3 == 0 {
        print("\(NumberDivision) делится на 3")
    } else {
        print("\(NumberDivision) не делится на 3")
    }
}

var b : Int = 12
DivisionBy3(NumberDivision: b)

// Домашнее задание №3

var GrowingArray: [Int] = []
    for n in 1...100 {
        GrowingArray.append(n)
    }
print("МАССИВ ИЗ 100 ЧИСЕЛ")
print("\(GrowingArray)")
print("\(GrowingArray.count)")

// Домашнее задание №4 вариант 1
// самый простой способ с добавлением нужных эл-в в новый массив
var NewGrowingArray: [Int] = []
var i: Int = 0
while i < GrowingArray.count {
    if (GrowingArray[i]%2 != 0 && GrowingArray[i]%3 == 0) {
        NewGrowingArray.append(GrowingArray[i])
        i+=1
    } else {
        i+=1
    }
}
print("МАССИВ ИЗМЕНЕННЫЙ")
print("\(NewGrowingArray)")

// Домашнее задание №4 вариант 2

var pool : Int = 0
while pool < GrowingArray.count {
if (GrowingArray[pool]%2==0 || GrowingArray[pool]%3 != 0){
    GrowingArray.remove(at: pool)
    // тут не увеличиваем pool, так как индексы сдвинулись на единицу
} else {
    pool+=1
}
}
print("МАССИВ ИЗМЕНЕННЫЙ")
print("\(GrowingArray)")

// Домашнее задание №5

var FibArray: [Int] = []
for i in 0...49 {
    switch i {
    case 0:
        let OneNum = 0
        FibArray.append(OneNum)
    case 1:
        let TwoNum = 1
        FibArray.append(TwoNum)
    default:
        let Num = FibArray[i-1] + FibArray[i-2]
        FibArray.append(Num)
        break
    }
}
print("МАССИВ ЧИСЕЛ ФИБОНАЧЧИ")
print(FibArray)
print(FibArray.count)

// Домашнее задание №6

var SimpleArray: [Int] = []
for w in 2...600 {
    switch w {
    case 2:
        SimpleArray.append(w)
    case 3:
        SimpleArray.append(w)
// Добавили первые два простых числа
    default:
        if SimpleArray.count != 100 { // проверяем размер массива
        var z: Int = 0
        while z<SimpleArray.count {
            if (w%SimpleArray[z] != 0) {
                // проверяем делится ли новое число на предыдущие элементы массива
                if z == SimpleArray.count-1 { // если все числа уже проверены
                    SimpleArray.append(w)
                    break
                } else {
                    z+=1
                continue // иначе продолжаем цикл
                }
            } else {
                break // что-то делится и мы выходим из цикла
            }
        }
        } else {
            break // выходим когда размер массива равен 100
        }
    }
}
print("МАССИВ ПРОСТЫХ ЧИСЕЛ")
print(SimpleArray)
print(SimpleArray.count)
