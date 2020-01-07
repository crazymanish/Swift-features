//: [Previous](@previous)
import Foundation

//Details: https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md

let json = """
{
"name":"Manish Rathi",
"country":"INDIA",
"dob":"1992-03-01",
"updated":"2019-11-26T16:39:57-08:00",
}
"""

struct User: Codable {
    let name: String
    let country: String

    @CodableDate<YYYYMMDDDateStrategy>
    var dob: Date //property wrapper can only be applied to a 'var'

    @CodableDate<ISO8601Strategy>
    var updated: Date
}

do {
    let jsonData = json.data(using: .utf8)!
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print("Name: \(user.name)")
    print("Country: \(user.country)")
    print("Date of birth: \(user.dob)")
    print("Updated at: \(user.updated)")
} catch {
    print(error)
}

//: [Next](@next)
