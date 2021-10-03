//
//  main.swift
//  3I_KharitonovStepan
//
//  Created by Степан Харитонов on 29.09.2021.
//

import Foundation

// ДЗ к занятию №3

enum CarWindow {
    case open
    case close
}

enum CarEngine {
    case launch
    case unlaunch
}

enum LoadingCar {
    case upload
    case unload
}

// Структура легкового автомобиля

struct Car {
    let Brand: String
    let Model: String
    let Output: Int
    let VolumeBoot: Double
    var Engine: CarEngine
    var Window: CarWindow
    var BootUsed: Double
    
    mutating func VarWindow() { // функция закрытия/открытия окон
        switch self.Window {
        case .open:
            self.Window = .close
        case .close:
            self.Window = .open
        }
    }
    
    mutating func VarEngine() { // функция запуска/выключения двигателя
        switch self.Engine {
        case .unlaunch:
            self.Engine = .launch
        case .launch:
            self.Engine = .unlaunch
        }
    }
    
    // функция загрузки/разгрузки авто
    // BootUsed - это начальная загрузка авто
    // VolumeBoot - это объем багажника/кузова
    // Load - это объем, который мы хотим загрузить или выгрузить
    
    mutating func LoadBoot(Load: Double, mode: LoadingCar) {
        switch mode {
        case .unload:
            if (Load < self.BootUsed) {
                self.BootUsed = self.BootUsed - Load
            } else {
                // мы не можем разгрузить машину больше, чем в неё загружено
                self.BootUsed = 0
            }
        case .upload:
            if (Load > self.VolumeBoot) {
                // мы не можем загрузить машину больше её объема
                self.BootUsed = self.VolumeBoot
            } else {
                self.BootUsed = self.BootUsed + Load
            }
        }
    }
    
}

//  Структура грузового автомобиля

struct LorryCar {
    let Brand: String
    let Model: String
    let Output: Int
    let VolumeBoot: Double
    var Engine: CarEngine
    var Window: CarWindow
    var BootUsed: Double
    
    mutating func VarWindow() { // функция закрытия/открытия окон
        switch self.Window {
        case .open:
            self.Window = .close
        case .close:
            self.Window = .open
        }
    }
    
    mutating func VarEngine() { // функция запуска/выключения двигателя
        switch self.Engine {
        case .unlaunch:
            self.Engine = .launch
        case .launch:
            self.Engine = .unlaunch
        }
    }
    
    // функция загрузки/разгрузки авто
    // BootUsed - это начальная загрузка авто
    // VolumeBoot - это объем багажника/кузова
    // Load - это объем, который мы хотим загрузить или выгрузить
    
    mutating func LoadBoot(Load: Double, mode: LoadingCar) {
        switch mode {
        case .unload:
            if (Load < self.BootUsed) {
                self.BootUsed = self.BootUsed - Load
            } else {
                // мы не можем разгрузить машину больше, чем в неё загружено
                self.BootUsed = 0
            }
        case .upload:
            if (Load > self.VolumeBoot) {
                // мы не можем загрузить машину больше её объема
                self.BootUsed = self.VolumeBoot
            } else {
                self.BootUsed = self.BootUsed + Load
            }
        }
    }
    
}

var car1 = Car(Brand: "Volkswagen", Model: " Polo MK6", Output: 2020, VolumeBoot: 530, Engine: .unlaunch, Window: .close, BootUsed: 125)
var lorry1 = LorryCar(Brand: "KAMAZ", Model: "6540", Output: 2005, VolumeBoot: 20000, Engine: .unlaunch, Window: .close, BootUsed: 0)
 
// Пункт 5

car1.LoadBoot(Load: 100, mode: .upload)
car1.VarEngine()
car1.VarWindow()
lorry1.LoadBoot(Load: 13000, mode: .upload)
lorry1.VarWindow()
lorry1.VarEngine()

// Пункт 6

print(car1.Brand)
print(car1.Engine)
print(car1.Window)
print(lorry1.Brand)
print(lorry1.Engine)
print(lorry1.Window)
print(lorry1)
print(car1)
