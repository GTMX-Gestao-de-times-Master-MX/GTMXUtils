import Foundation

extension String {
    public func dateFormatter(from fromFormat: String, to toFormat: String) -> String? {
        let dateFormatter = Date.dateFormatter
        dateFormatter.dateFormat = fromFormat
        guard let data = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.dateFormat = toFormat
        return dateFormatter.string(from: data)
    }
}
