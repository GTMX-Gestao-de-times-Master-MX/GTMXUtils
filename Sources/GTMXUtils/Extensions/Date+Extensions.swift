import Foundation

extension Date {
    public init(dateString: String) {
        if let date = Date.iso8601Formatter.date(from: dateString) {
            self = date
            return
        }

        let formatter = Date.dateFormatter
        formatter.dateFormat = DateFormats.iso8601
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.full
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.medium
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.mediumHyphenated
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.short
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.compact
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.isoDateTime
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        formatter.dateFormat = DateFormats.backend
        if let date = Date.dateFormatter.date(from: dateString) {
            self = date
            return
        }

        self = Date()
    }

    public static let iso8601Formatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()

        return formatter
    }()

    public static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "pt_BR")

        return formatter
    }()

    /**
     Date string in the specified format from date

     - parameter format: Date format
     - returns: Date string
    */
    public func string(withFormat format: String) -> String {
        let dateFormatter = Date.dateFormatter
        dateFormatter.dateFormat = format
        let dateString = dateFormatter.string(from: self)

        return dateString
    }

    /**
     Counts the number of days passed since the start (inclusive) and end date (exclusive)

     - parameter from: The start date
     - parameter to: The end date
     - returns: The integer representing the count of days, -1 if not successful
     */
    public static func daysInBetween(from: Date, to: Date) -> Int {
        let calendar = Calendar.current
        let fromDate = calendar.startOfDay(for: from)
        let toDate = calendar.startOfDay(for: to)
        let daysCount = calendar.dateComponents([.day], from: fromDate, to: toDate)

        return daysCount.day ?? -1
    }

    /**
     Create a Date object from a Epoch & Unix Timestamp in milliseconds

     - parameter interval: The Int time interval
     - returns: The Date object created from the timestamp
     */
    public func timeIntervalToDate(_ interval: Int) -> Date {
        let timeInterval = TimeInterval(interval)
        return Date(timeIntervalSince1970: timeInterval / 1000)
    }

    public func reduceToMonthDayYear() -> Date {
        let calendar = Calendar.current
        let month = calendar.component(.month, from: self)
        let day = calendar.component(.day, from: self)
        let year = calendar.component(.year, from: self)
        let dateFormatter = Date.dateFormatter
        dateFormatter.dateFormat = "MM/dd/yyyy"

        return dateFormatter.date(from: "\(month)/\(day)/\(year)") ?? Date()
    }

    public func timeAgo(_ from: Date = Date()) -> DateComponents {
        var components: DateComponents {
            Calendar.current.dateComponents([.year, .month, .day], from: self, to: from)
        }

        return components
    }
}
