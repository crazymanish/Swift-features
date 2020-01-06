//: [Previous](@previous)
import Foundation

//Reference: https://developer.apple.com/documentation/swift/never
//Details:
//https://github.com/apple/swift-evolution/blob/master/proposals/0102-noreturn-bottom-type.md
//https://github.com/apple/swift-evolution/blob/master/proposals/0215-conform-never-to-hashable-and-equatable.md


func alwaysSucceeds(_ completion: (Result<String, Never>) -> Void) {
    completion(.success("yes!"))
}

alwaysSucceeds { (result) in
    switch result {
    case .success(let string):
        print("\(string) This will never return error, so No need of implement failure case! :swift:")
    }
}

//: [Next](@next)
