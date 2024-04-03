import UIKit

class Car {
    
    let models: [String] = ["Toyota", "Hyundai", "Kia", "Chevrolet", "Porsche"]
    let mpcs: [Int] = [12, 15, 20]
    let types: [String: [Double]] = ["Sedan": [2.5], "SUV": [3.0, 3.5, 4.0], "Sport": [5.0, 5.5, 6.0, 6.5, 7.0, 7.5, 8.0]]
    
    var type: String
    var model: String
    var mpc: Int
    
    init(type: String, model: String, mpc: Int) {
        self.type = type
        self.model = model
        self.mpc = mpc
    }
}

func chooseType() -> String? {
    print("Choose a type of car:")
    let types = ["Sedan", "SUV", "Sport"]
    for (index, type) in types.enumerated() {
        print("\(index + 1). \(type)")
    }
    if let choice = readLine(), let index = Int(choice), index > 0 && index <= types.count {
        return types[index - 1]
    } else {
        print("Invalid choice.")
        return nil
    }
}

func chooseModel() -> String? {
    print("Choose a model of car:")
    let models = ["Toyota", "Hyundai", "Kia", "Chevrolet", "Porsche"]
    for (index, model) in models.enumerated() {
        print("\(index + 1). \(model)")
    }
    if let choice = readLine(), let index = Int(choice), index > 0 && index <= models.count {
        return models[index - 1]
    } else {
        print("Invalid choice.")
        return nil
    }
}


func chooseMPC() -> Int? {
    print("Choose miles per charge:")
    let mpcs = [12, 15, 20]
    for (index, mpc) in mpcs.enumerated() {
        print("\(index + 1). \(mpc)")
    }
    if let choice = readLine(), let index = Int(choice), index > 0 && index <= mpcs.count {
        return mpcs[index - 1]
    } else {
        print("Invalid choice.")
        return nil
    }
}

var cars = [Car]()

chooseType()
chooseModel()
chooseMPC()

for _ in 1...3 {
    if let chosenType = chooseType(),
       let chosenModel = chooseModel(),
       let chosenMPC = chooseMPC() {
        let car = Car(type: chosenType, model: chosenModel, mpc: chosenMPC)
        cars.append(car)
    }
}


print("Cars sold today:")
for car in cars {
    print("Type: \(car.type), Model: \(car.model), MPC: \(car.mpc)")
}
