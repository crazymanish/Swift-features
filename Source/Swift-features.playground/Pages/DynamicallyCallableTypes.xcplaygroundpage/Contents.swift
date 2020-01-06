//: [Previous](@previous)
import Foundation

//Details: https://github.com/apple/swift-evolution/blob/master/proposals/0216-dynamic-callable.md

@dynamicCallable
class DynamicFeatures {
    func dynamicallyCall(withArguments params: [Int]) -> Int? {
        guard !params.isEmpty else {
            return nil
        }
        return params.reduce(0, +)
    }

    func dynamicallyCall(withKeywordArguments params: KeyValuePairs<String, Int>) -> Int? {
        guard !params.isEmpty else {
            return nil
        }
        return params.reduce(0) { $1.key.isEmpty ? $0 : $0 + $1.value }
    }
}

let features = DynamicFeatures()
features(3, 4, 5) // 12
features(first: 3, 4, second: 5) // 8

//: [Next](@next)
