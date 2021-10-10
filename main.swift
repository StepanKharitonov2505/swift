//
//  main.swift
//  5I_KharitonovStepan
//
//  Created by Степан Харитонов on 10.10.2021.
//

import Foundation

// Домашнее задание к уроку №5

// Задание №1

enum CarWindow: CustomStringConvertible {
    case open
    case close
    
    var description: String  {
        switch self {
                     case .open :
                     return "Окна открыты"
                     case .close :
                     return "Окна закрыты"
                    }
          }
}

enum CarEngine: CustomStringConvertible {
    case launch
    case unlaunch
    
    var description: String {
        switch self {
                     case .launch :
                     return "Двигатель запущен"
                     case .unlaunch :
                     return "Двигатель заглушен"
                    }
          }
}

enum LoadCar {
    case LoadingTruck
    case UnloadingTruck
}

protocol Car {
    var Brand : String { get }
    var Model : String { get }
    var Output : Int { get }
    var Window : CarWindow { get set }
    var Engine : CarEngine { get set }
}

// Задание №2

extension Car {
    mutating func VarWindow(mode: CarWindow) {
        self.Window = mode
    }
    mutating func VarEngine(mode: CarEngine) {
        self.Engine = mode
    }
}

// Задание №3

class TrunkCar : Car {
    var Brand: String
    var Model: String
    var Output: Int
    var Window: CarWindow = .close
    var Engine: CarEngine = .unlaunch
    var MaxWeight: Int
    var VolumeBoot: Double
    var BootUsed: Double = 0
    
    init(Brand: String, Model: String, Output: Int, MaxWeight: Int,
         VolumeBoot: Double) {
        self.Brand = Brand
        self.Model = Model
        self.Output = Output
        self.MaxWeight = MaxWeight
        self.VolumeBoot = VolumeBoot
    }
}

extension TrunkCar {
    func LoadTruck(Load: Double, Choice: LoadCar) {
        switch Choice {
               case .LoadingTruck:
                    if (Load > self.VolumeBoot) {
                    self.BootUsed = self.VolumeBoot
                    } else {
                        if (self.BootUsed+Load > self.VolumeBoot) {
                            self.BootUsed = self.VolumeBoot
                        } else {
                            self.BootUsed = self.BootUsed + Load
                        }
                    }
               case .UnloadingTruck:
                    if (Load < self.BootUsed) {
                    self.BootUsed = self.BootUsed - Load
                    } else {
                    self.BootUsed = 0
                    }
              }
       }
}

class SportCar: Car {
    var Brand: String
    var Model: String
    var Output: Int
    var Window: CarWindow = .close
    var Engine: CarEngine = .unlaunch
    var MaxSpeed: Int
    var AccelerationTo100: Double
    
    init(Brand: String, Model: String, Output: Int, MaxSpeed: Int,
         AccelerationTo100: Double) {
        self.Brand = Brand
        self.Model = Model
        self.Output = Output
        self.MaxSpeed = MaxSpeed
        self.AccelerationTo100 = AccelerationTo100
    }
}

// Задание №4

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Брэнд - \(Brand)\n" +
        "Модель - \(Model)\n" +
        "Год выпуска - \(Output)\n" +
        "Объем кузова - \(VolumeBoot) литров\n" +
        "Максимальный вес - \(MaxWeight) тонн\n" +
        "Состояния : \(Window) , \(Engine)\n" +
        "\(BootUsed) литров загружено в кузов .\n"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Брэнд - \(Brand)\n" +
        "Модель - \(Model)\n" +
        "Год выпуска - \(Output)\n" +
        "Состояния : \(Window) , \(Engine)\n" +
        "Максимальная скорость : \(MaxSpeed) км/ч.\n" +
        "Разгон до 100 за \(AccelerationTo100) секунд.\n"
    }
}

// Задание №5

var sportcar1 = SportCar(Brand: "Audi", Model: "A8", Output: 2020, MaxSpeed: 356, AccelerationTo100: 5.5)
var sportcar2 = SportCar(Brand: "BMW", Model: "i320", Output: 2013, MaxSpeed: 320, AccelerationTo100: 6.3)
var trunkcar1 = TrunkCar(Brand: "KAMAZ", Model: "6520", Output: 2005, MaxWeight: 13, VolumeBoot: 20000)

// Действия над объектами

sportcar1.VarEngine(mode: .launch)
sportcar1.VarWindow(mode: .open)
sportcar2.VarEngine(mode: .launch)
sportcar2.VarWindow(mode: .open)
trunkcar1.LoadTruck(Load: 13245, Choice: .LoadingTruck)

print(sportcar1)
print(sportcar2)
print(trunkcar1)

// Проверка корректности работы функции загрузки в грузовом автомобиле

trunkcar1.LoadTruck(Load: 7734.15, Choice: .LoadingTruck)
trunkcar1.VarWindow(mode: .open)
trunkcar1.VarEngine(mode: .launch)
print(trunkcar1)
