//: [Previous](@previous)
import Foundation

//Implicit returns from single-expression functions
//Details: https://github.com/apple/swift-evolution/blob/master/proposals/0255-omit-return.md

struct User {
    let firstName: String = "Firstname"
    let lastName: String = "Lastname"

    var name: String { firstName + " " + lastName }

    var name1: String {
        get {
            return firstName + " " + lastName
        }
    }

    func greeting() -> String {
        "Hello, " + firstName + "!"
    }
}

let user = User()

print(user.name)
print(user.greeting())

// NO

//: [Next](@next)
