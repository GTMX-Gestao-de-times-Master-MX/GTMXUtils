import Foundation

public enum DateFormats {
    // MARK: - Brazilian

    /// "dd/MM"
    public static let compact = "dd/MM"
    /// "dd/MM - HH:mm"
    public static let compactHyphenated = "dd/MM - HH:mm"
    /// "dd/MM/yyyy"
    public static let short = "dd/MM/yyyy"
    /// "dd/MM/yyyy HH:mm"
    public static let medium = "dd/MM/yyyy HH:mm"
    /// "dd/MM/yyyy - HH:mm"
    public static let mediumHyphenated = "dd/MM/yyyy - HH:mm"
    /// "dd/MM/yyyy HH:mm:ss"
    public static let full = "dd/MM/yyyy HH:mm:ss"
    /// "dd/MM/yyyy - HH:mm:ss"
    public static let fullHyphenated = "dd/MM/yyyy - HH:mm:ss"
    /// "MMMM '/' YYYY"
    public static let monthYear = "MMMM '/' YYYY"
    /// "dd MMM"
    public static let dayAndShorthandNameMonth = "dd MMM"

    // MARK: - International

    /// "yyyy-MM-dd"
    public static let backend = "yyyy-MM-dd"
    /// "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    public static let iso8601 = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    /// "yyyy-MM-dd HH:mm:ss"
    public static let isoDateTime = "yyyy-MM-dd HH:mm:ss"
}
