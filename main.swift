//
//  main.swift
//  main
//
//  Created by Степан Харитонов on 22.09.2021.
//

import Foundation

// Домашнее задание №1.1

var a = 3
var b = 7
var c = 3
var d = pow(Double(b),2) // меняю тип данных для функции pow
var f = (d - 4*(Double(a)*Double(c)))
if f < 0 {
    print("Задание номер 1.1")
    print("Корней нет, введи другие переменные")
} else if f == 0 {
    let x0: Int = (-b/(2*a))
    print("Задание номер 1.1")
    print("Ваш корень ", x0)
} else {
let f1 = pow(f,0.5)
let x1: Float = (-Float(b) + Float(f1))/(2*Float(a)) // меняю тип данных тк корни могут быть дробными
let x2: Float = (-Float(b) - Float(f1))/(2*Float(a))
print("Задание номер 1.1")
print("Ваш первый корень ", x1)
print("Ваш второй корень ", x2)
}

// Домашнее задание №1.2

print("Задание номер 1.2")
var a1 = 5
var b1 = 5
let a1pow = pow(Double(a1),2)
let b1pow = pow(Double(b1),2)
let c1: Double = pow((a1pow + b1pow),0.5)
print("Гипотенуза равна ", (c1))
let P = Double(a1) + Double(b1) + c1
let S = 0.5*Double(a1)*Double(b1)
print("Периметр равен ", P)
print("Площадь равна ", S)

// Домашнее задание №1.3
print("Задание номер 1.3")
var SummVklad: Double = 1000
var YearProcent = 6
var YearVklad = 5
var newYearProcent: Double = (1 + Double(YearProcent)/100)
for _ in 1...YearVklad {
     SummVklad = SummVklad * newYearProcent
}
let Final = String(format: "%.2f" , SummVklad )
print("Ваш вклад за ", YearVklad, " лет стал таким ", Final)


