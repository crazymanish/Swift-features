//: [Previous](@previous)
import Foundation

//Reference: https://developer.apple.com/documentation/swift/result
//Details: https://github.com/apple/swift-evolution/blob/master/proposals/0235-add-result.md

//Using get() Api
let integerResult: Result<Int, Error> = .success(5)
do {
    let value = try integerResult.get()
    print("The value is \(value).")
} catch {
    print("Error retrieving the value: \(error)")
}

//Old way (+1 Cyclomatic complexity)
switch integerResult {
case .success(let value):
    print("The value is \(value).")
case .failure(let error):
    print("Error retrieving the value: \(error)")
}



// Need only Value, ignore Error

//Using get() Api
if let value = try? integerResult.get() {
    print("The value is \(value).")
}

//Old way (+1 Cyclomatic complexity)
switch integerResult {
case .success(let value):
    print("The value is \(value).")
default:
    print("bla bla default implementation. i.e return,break,fatalError etc")
}

//: [Next](@next)
