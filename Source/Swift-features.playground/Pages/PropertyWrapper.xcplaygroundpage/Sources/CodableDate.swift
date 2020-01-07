import Foundation

public protocol CodableDateStrategy {
    associatedtype RawValue: Codable

    static func decode(_ value: RawValue) throws -> Date
    static func encode(_ date: Date) -> RawValue
}

@propertyWrapper
public struct CodableDate<DateStrategy: CodableDateStrategy>: Codable {
    private let value: DateStrategy.RawValue
    public var wrappedValue: Date

    public init(wrappedValue: Date) {
        self.wrappedValue = wrappedValue
        self.value = DateStrategy.encode(wrappedValue)
    }

    public init(from decoder: Decoder) throws {
        self.value = try DateStrategy.RawValue(from: decoder)
        self.wrappedValue = try DateStrategy.decode(value)
    }

    public func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}
