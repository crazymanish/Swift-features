import Foundation

public struct YYYYMMDDDateStrategy: CodableDateStrategy {
    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()

    public static func decode(_ value: String) throws -> Date {
        if let date = YYYYMMDDDateStrategy.dateFormatter.date(from: value) {
            return date
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: "Invalid Date Format!"))
        }
    }

    public static func encode(_ date: Date) -> String {
        return YYYYMMDDDateStrategy.dateFormatter.string(from: date)
    }
}
