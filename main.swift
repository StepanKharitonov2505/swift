//
//  main.swift
//  4I_KharitonovStepan
//
//  Created by Степан Харитонов on 03.10.2021.
//

import Foundation

// Домашнее задание к уроку №4



class Car {
    let Brand:      String
    let Model:      String
    let Output:     Int
    var Engine:     CarEngine = .unlaunch
    var Window:     CarWindow = .close

    enum CarWindow: CustomStringConvertible {
                    case open
                    case close
        
                    var description: String {
                                             switch self {
                                                          case .open:
                                                            return "Окно открыто"
                                                          case .close:
                                                            return "Окно закрыто"
                                                         }
                                            }
                                           }
    
    enum CarEngine: CustomStringConvertible {
                    case launch
                    case unlaunch
          
                    var description: String {
                                             switch self {
                                                          case .launch:
                                                            return "Двигатель запущен"
                                                          case .unlaunch:
                                                            return "Двигатель заглушен"
                                                         }
                                            }
                                           }
    
    enum BodyRaise: CustomStringConvertible {
                    case ToRaise
                    case ToLower
        
                    var description: String {
                                             switch self {
                                                          case .ToRaise:
                                                            return "Кузов поднят"
                                                          case .ToLower:
                                                            return "Кузов опущен"
                                                         }
                                            }
                                           }
    
    enum LoadTruck {
                    case LoadingTruck
                    case UnloadingTruck
                   }
    
    enum Spoiler: CustomStringConvertible {
                  case Lift
                  case Fold
        
                  var description: String {
                                           switch self {
                                                        case .Lift:
                                                          return "Спойлер поднят"
                                                        case .Fold:
                                                          return "Спойлер опущен"
                                                       }
                                          }
                                         }
    
    enum Action {
                 case WindowChoice ( CarWindow )
                 case EngineChoice ( CarEngine )
                 case OpetaionOnBody ( BodyRaise )
                 case LoadTruck ( Double , LoadTruck )
                 case OperationSpoiler ( Spoiler )
                }
    
    init(Brand: String, Model: String, Output: Int) {
                                                     self.Brand = Brand
                                                     self.Model = Model
                                                     self.Output = Output
                                                    }
    func influence (act: Action) {
        
                                 }
    
}

// Подкласс грузовых машин

class trunkCar: Car, CustomStringConvertible {
    
              var PairWheels: Int
              var MaxWeight: Int
              var RaiseBody: BodyRaise = .ToLower
              var BootUsed: Double = 0
              let VolumeBoot: Double
    
    var description: String {
        return "Брэнд - \(Brand), Модель - \(Model), Год выпуска - \(Output), Объем кузова - \(VolumeBoot) литров, Количество пар колёс - \(PairWheels) пар, Максимальный вес - \(MaxWeight) тонн, Состояния : \(Window) , \(Engine), \(RaiseBody), \(BootUsed) литров загружено в кузов ."
    }
    
    init(Brand: String, Model: String, Output: Int, VolumeBoot: Double, PairWheels: Int, MaxWeight: Int) {
        self.MaxWeight = MaxWeight
        self.PairWheels = PairWheels
        self.VolumeBoot = VolumeBoot
        super.init(Brand: Brand, Model: Model, Output: Output)
                        }
    
    override func influence(act: Action) {
        switch act {
        case .EngineChoice(let Choice1):
              Engine = Choice1
        case .WindowChoice(let Choice2):
              Window = Choice2
        case .OpetaionOnBody(let Choice3):
              RaiseBody = Choice3
        case .LoadTruck(let LoadSize, let Choice4):
              switch Choice4 {
                     case .LoadingTruck:
                           if (LoadSize > self.VolumeBoot) {
                           self.BootUsed = self.VolumeBoot
                           } else {
                           self.BootUsed = self.BootUsed + LoadSize
                           }
                     case .UnloadingTruck:
                           if (LoadSize < self.BootUsed) {
                           self.BootUsed = self.BootUsed - LoadSize
                           } else {
                           self.BootUsed = 0
                           }
                          }
        default:
                break
        }
       }
    
    
    
}

class sportCar: Car, CustomStringConvertible {
              var MaxSpeed: Int
              var AccelerationTo100: Double
              var SpoilerFunc: Spoiler = .Fold
    
    var description: String {
        return "Брэнд - \(Brand), Модель - \(Model), Год выпуска - \(Output), Максимальная скорость - \(MaxSpeed) км/ч, Разгон до 100 км/ч - \(AccelerationTo100) секунд, Состояния : \(Window) , \(Engine), \(SpoilerFunc) ."
    }
    
    init(Brand: String, Model: String, Output: Int, MaxSpeed: Int, AccelerationTo100: Double) {
        self.MaxSpeed = MaxSpeed
        self.AccelerationTo100 = AccelerationTo100
        super.init(Brand: Brand, Model: Model, Output: Output)
                                   }
    
    override func influence(act: Action) {
        switch act {
                    case .EngineChoice(let Choice1):
                          Engine = Choice1
                    case .WindowChoice(let Choice2):
                          Window = Choice2
                    case .OperationSpoiler(let Choice3):
                          switch Choice3 {
                                          case .Lift:
                                            SpoilerFunc = .Lift
                                          case .Fold:
                                                if SpoilerFunc == .Lift {
                                                SpoilerFunc = .Fold
                                                } else {
                                                break
                                                }
                                          }
                    default:
                            break
                    }
                   }
    
}

var sportcar1 = sportCar(Brand: "Audi", Model: "A8", Output: 2020, MaxSpeed: 356, AccelerationTo100: 5.5)

// Действия над спорткаром

sportcar1.influence(act: .WindowChoice(.open))
sportcar1.influence(act: .EngineChoice(.launch))
sportcar1.influence(act: .OperationSpoiler(.Lift))
print(sportcar1.SpoilerFunc)
print(sportcar1.Engine)
print(sportcar1.Window)

var trunkcar1 = trunkCar(Brand: "KAMAZ", Model: "6520", Output: 2005, VolumeBoot: 20000, PairWheels: 3, MaxWeight: 13)

// Действия над грузовым автомобилем

trunkcar1.influence(act: .EngineChoice(.launch))
trunkcar1.influence(act: .WindowChoice(.open))
trunkcar1.influence(act: .OpetaionOnBody(.ToRaise))
trunkcar1.influence(act: .LoadTruck(12300, .LoadingTruck))
print(trunkcar1.BootUsed)
print(trunkcar1.RaiseBody)
print(trunkcar1.Window)
print(trunkcar1.Engine)

trunkcar1.influence(act: .LoadTruck(15000, .UnloadingTruck))
trunkcar1.influence(act: .EngineChoice(.unlaunch))
print(trunkcar1.Engine)
print(trunkcar1.BootUsed)

print(trunkcar1)
print(sportcar1)
