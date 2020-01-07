//: [Previous](@previous)
import Foundation

//Link: https://developer.apple.com/documentation/swift/keyvaluepairs
//Details: https://github.com/apple/swift-evolution/blob/master/proposals/0214-DictionaryLiteral.md

/*
 A lightweight collection of key-value pairs.

 - We can add items with duplicate keys.
 - The order in which we add items is preserved.
 */

let singer: KeyValuePairs = ["firstName": "Taylor",
                             "lastName": "Swift",
                             "lastName": "Swift-duplicate key"]

print("\(singer[0].key) is set to \(singer[0].value)")

print("\n\n----\n\n")

for value in singer {
    print("\(value.key) is set to \(value.value)")
}

// NO

//: [Next](@next)
