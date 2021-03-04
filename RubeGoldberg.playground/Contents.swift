import UIKit

protocol CanAdd{
    func add(a: String?, b: String?) -> String
    var sum:Double? {get}
    
}


extension String{
    func isDouble() -> Bool {
        return Double(self) != nil
    }
}

func randomString() -> String {
    var string:String = ""
    for _ in 1...2{
        let result = Int.random(in: 1...100)
        switch result {
        case 13:
            string += "unlucky"
        case 100:
            string += "+100500"
        case 3:
            string += "-3,woohoo"
        default:
            string += String(result)
        }
        string += "."
    }
    return String(string.dropLast())
}

class Calculator:CanAdd{
    var addend1:String
    var addend2:String
    var sum: Double?{
        get{
            let additionResult = add(a: addend1, b: addend2)
            guard additionResult.isDouble() else{
                return nil;
            }
            return Double(additionResult)
        }
    }
    init() {
        addend1 = randomString()
        addend2 = randomString()
    }
    
    func add(a: String? = nil, b: String? = nil) -> String {
        if let add1 = a {
            if let add2 = b {
                guard add1.isDouble() && add2.isDouble() else{
                    return "Could not convert \(add1) or \(add2) to Double"
                }
                return String(Double(add1)! + Double(add2)!)
            }
        }
        guard addend1.isDouble() && addend2.isDouble() else {
            return "Could not convert \(addend1) or \(addend2) to Double"
        }
        return String(Double(addend1)! + Double(addend2)!)
    }
}

var calc = Calculator()
calc.addend1
calc.addend2
calc.sum
calc.add(a: "13.3", b: "8")


