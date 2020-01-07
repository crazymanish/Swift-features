import Foundation

public struct ISO8601Strategy: CodableDateStrategy {
    public static func decode(_ value: String) throws -> Date {
        guard let date = ISO8601DateFormatter().date(from: value) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid Date Format!"))
        }
        return date
    }

    public static func encode(_ date: Date) -> String {
        return ISO8601DateFormatter().string(from: date)
    }
}
