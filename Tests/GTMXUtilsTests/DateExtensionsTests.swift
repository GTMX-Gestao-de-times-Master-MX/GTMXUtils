import XCTest
import Foundation
@testable import GTMXUtils

final class DateExtensionsTests: XCTestCase {
    private var date: Date?

    override func setUp() {
        super.setUp()

        let dateComponents = makeDateComponents(dateComponent: DateComponent(year: 1993,
                                                                             month: 8,
                                                                             day: 13,
                                                                             hour: 23,
                                                                             minute: 30,
                                                                             second: 00))
        let calendar = Calendar.current
        date = calendar.date(from: dateComponents)
    }

    override func tearDown() {
        date = nil

        super.tearDown()
    }

    func testStringFormatCompact() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.compact)
        let expectedDateString = "13/08"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatCompactHyphenated() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.compactHyphenated)
        let expectedDateString = "13/08 - 23:30"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatShort() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.short)
        let expectedDateString = "13/08/1993"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatMedium() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.medium)
        let expectedDateString = "13/08/1993 23:30"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatMediumHyphenated() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.mediumHyphenated)
        let expectedDateString = "13/08/1993 - 23:30"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatFull() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.full)
        let expectedDateString = "13/08/1993 23:30:00"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatMonthYear() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.monthYear)
        let expectedDateString = "agosto / 1993"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatDayAndShorthandNameMonth() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.dayAndShorthandNameMonth)
        var expectedDateString = ""
        if #available(iOS 14.0, *) {
            expectedDateString = "13 ago."
        } else {
            expectedDateString = "13 ago"
        }

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatBackend() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.backend)
        let expectedDateString = "1993-08-13"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testStringFormatIsoDateTime() {
        // Given
        XCTAssertNotNil(date)

        // When
        let dateString = date?.string(withFormat: DateFormats.isoDateTime)
        let expectedDateString = "1993-08-13 23:30:00"

        // Then
        XCTAssertEqual(dateString, expectedDateString)
    }

    func testTimeIntervalToDate() {
        // Given
        XCTAssertNotNil(date)

        // When
        let timestampInMilliseconds = 745295400000
        let newDate = Date().timeIntervalToDate(timestampInMilliseconds)
        let expectedDate = date

        // Then
        XCTAssertEqual(newDate, expectedDate)
    }

    func testReduceToMonthDayYear() {
        // Given
        XCTAssertNotNil(date)

        // When

        let dateComponents = makeDateComponents(dateComponent: DateComponent(year: 1993, month: 8, day: 13))
        let calendar = Calendar(identifier: .gregorian)
        let expectedDate = calendar.date(from: dateComponents)

        // Then
        XCTAssertEqual(date?.reduceToMonthDayYear(), expectedDate)
    }

    func testInitDateStringIso8601() {
        // Then
        expected(dateComponent: DateComponent(year: 1993, month: 8, day: 13, hour: 23, minute: 30, second: 00), dateFormat: DateFormats.iso8601)
    }

    func testInitDateStringCompact() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13),
                 dateFormat: DateFormats.compact)
    }

    func testInitDateStringShort() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13),
                 dateFormat: DateFormats.short)
    }

    func testInitDateStringMedium() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13, hour: 23, minute: 30),
                 dateFormat: DateFormats.medium)
    }

    func testInitDateStringMediumHyphenated() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13, hour: 23, minute: 30),
                 dateFormat: DateFormats.mediumHyphenated)
    }

    func testInitDateStringFull() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13, hour: 23, minute: 30, second: 00),
                 dateFormat: DateFormats.full)
    }

    func testInitDateStringIsoDateTime() {
        // Then
        expected(dateComponent: DateComponent(year: 2000, month: 8, day: 13, hour: 23, minute: 30, second: 00),
                 dateFormat: DateFormats.isoDateTime)
    }

    func testInitDateStringBackend() {
        // Then
        expected(dateComponent: DateComponent(year: 1993, month: 8, day: 13), dateFormat: DateFormats.backend)
    }

    func testTimeAgoShouldYearIs33() throws {
        let timeAgo = Date(dateString: "13/01/1988")
        let components = timeAgo.timeAgo(Date(dateString: "27/12/2021"))

        XCTAssertEqual(components.year, 33)
    }

    func testTimeAgoShouldMonthIs11() throws {
        let timeAgo = Date(dateString: "13/01/1988")
        let components = timeAgo.timeAgo(Date(dateString: "27/12/2021"))

        XCTAssertEqual(components.month, 11)
    }

    func testTimeAgoShouldDayIs14() throws {
        let timeAgo = Date(dateString: "13/01/1988")
        let components = timeAgo.timeAgo(Date(dateString: "27/12/2021"))

        XCTAssertEqual(components.day, 14)
    }
}

extension DateExtensionsTests {
    private func makeDateComponents(dateComponent: DateComponent) -> DateComponents {
        var dateComponents = DateComponents()
        dateComponents.year = dateComponent.year
        dateComponents.month = dateComponent.month
        dateComponents.day = dateComponent.day
        dateComponents.hour = dateComponent.hour
        dateComponents.minute = dateComponent.minute
        dateComponents.second = dateComponent.second

        return dateComponents
    }

    private func expected(dateComponent: DateComponent,
                          dateFormat: String,
                          file: StaticString = #filePath,
                          line: UInt = #line) {
        let dateComponents = makeDateComponents(dateComponent: dateComponent)

        let calendar = Calendar(identifier: .gregorian)
        guard let expectedDate = calendar.date(from: dateComponents) else {
            XCTFail("Don't have formatted date")
            return
        }
        let dateFormatted = expectedDate.string(withFormat: dateFormat)
        let receivedDate = Date(dateString: dateFormatted)

        // Then
        XCTAssertEqual(receivedDate, expectedDate, file: file, line: line)
    }

    private struct DateComponent {
        var year: Int?
        var month: Int?
        var day: Int?
        var hour: Int?
        var minute: Int?
        var second: Int?
    }
}
