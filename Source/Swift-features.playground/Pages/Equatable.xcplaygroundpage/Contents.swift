//: [Previous](@previous)
import Foundation

//Reference: https://developer.apple.com/documentation/swift/equatable

//Enum
//For an enum, all its associated values must conform to Equatable.
enum Currency {
    case usd
    case euro
    case custom(code: String)
}
extension Currency: Equatable {}

print(Currency.usd == Currency.usd)
print(Currency.custom(code: "bla bla") == Currency.custom(code: "bla bla"))

//An enum without associated values has Equatable conformance even without the declaration.
enum ApplicationState {
    case active
    case inActive
}

print(ApplicationState.active == ApplicationState.active)



//Struct
//For a struct, all its stored properties must conform to Equatable.
struct User {
    let name: String = "bla bla"
}
extension User: Equatable {}

let user = User()
print(user == user)



//Class
class FilterViewModel {
    var isFiltering: Bool = false
}
extension FilterViewModel: Equatable {}
func == (lhs: FilterViewModel, rhs: FilterViewModel) -> Bool {
    return lhs.isFiltering == rhs.isFiltering
}

let filterViewModel = FilterViewModel()
print(filterViewModel == filterViewModel)

//: [Next](@next)
