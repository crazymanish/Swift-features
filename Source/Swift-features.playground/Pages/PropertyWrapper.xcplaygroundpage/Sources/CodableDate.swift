import Foundation

public protocol CodableDateStrategy {
    static func decode(_ value: String) throws -> Date
    static func encode(_ date: Date) -> String
}

@propertyWrapper
public struct CodableDate<DateStrategy: CodableDateStrategy>: Codable {
    private let value: String
    public var wrappedValue: Date

    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
        self.value = DateStrategy.encode(wrappedValue)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.value = try container.decode(String.self)

        self.wrappedValue = try DateStrategy.decode(value)
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
