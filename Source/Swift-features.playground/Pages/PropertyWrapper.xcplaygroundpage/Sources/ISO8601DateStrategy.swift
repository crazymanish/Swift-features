import Foundation

public struct ISO8601DateStrategy: CodableDateStrategy {
    private static let dateFormatter: ISO8601DateFormatter = {
        return ISO8601DateFormatter()
    }()

    public static func decode(_ value: String) throws -> Date {
        guard let date = ISO8601DateStrategy.dateFormatter.date(from: value) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid Date Format!"))
        }
        return date
    }

    public static func encode(_ date: Date) -> String {
        return ISO8601DateStrategy.dateFormatter.string(from: date)
    }
}
