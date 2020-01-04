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



//`Result` has an initializer that accepts a throwing closure: if the closure returns a value successfully that gets used for the `success` case, otherwise the thrown error is  placed into the `failure` case.

//Example:
enum ValidationError: Error {
    case noValidName
}
struct User {
    let name: String
}

func createUser(name: String) throws -> User {
    guard name.count > 0 else {
        throw ValidationError.noValidName
    }

    return User(name: name)
}

let validUser = Result { try createUser(name: "Valid Name") }
print(validUser)

let inValidNameUser = Result { try createUser(name: "") }
print(inValidNameUser)

//: [Next](@next)
