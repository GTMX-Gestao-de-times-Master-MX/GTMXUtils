import Foundation

extension Formatter {
    public static let iso8601: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]

        return formatter
    }()

    static let iso8601noFS = ISO8601DateFormatter()

    static let dateComponents: DateComponentsFormatter = {
           let formatter = DateComponentsFormatter()
           formatter.unitsStyle = .full
           formatter.allowedUnits = [.day, .month, .year]
           formatter.maximumUnitCount = 1
           return formatter
       }()
}
