//
//  DateExtensionTests.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2016 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import XCTest
import Foundation
@testable import BFKit

class DateExtensionTests: XCTestCase {
    static let allTests = [
        ("testYear", testYear),
        ("testMonth", testMonth),
        ("testDay", testDay),
        ("testHour", testHour),
        ("testMinute", testMinute),
        ("testSecond", testSecond),
        ("testWeekday", testWeekday),
        ("testInitYearMonthDayHourMinuteSecond", testInitYearMonthDayHourMinuteSecond),
        ("testInitParseFormat", testInitParseFormat),
        ("testInitDateTime", testInitDateTime),
        ("testDaysBetween", testDaysBetween),
        ("testIsToday", testIsToday),
        ("testIsSameDay", testIsSameDay),
        ("testAddingDays", testAddingDays),
        ("testAddDays", testAddDays),
        ("testYearString", testYearString),
        ("testShortDate", testShortDate),
        ("testIsGreaterThan", testIsGreaterThan),
        ("testIsLessThan", testIsLessThan),
        ("testIsEqual", testIsEqual),
        ("testYesterday", testYesterday),
        ("testDecriptionDateSeparatorUSFormatNanosecond", testDecriptionDateSeparatorUSFormatNanosecond)
    ]
    
    var date = Date(year: 2016, month: 10, day: 9, hour: 10, minute: 9, second: 30)!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testYear() {
        date.year = 2017
        
        XCTAssert(date.year == 2017)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testMonth() {
        date.month = 11
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 11)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testDay() {
        date.day = 10
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 10)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testHour() {
        date.hour = 11
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 11)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 30)
    }
    
    func testMinute() {
        date.minute = 10
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 10)
        XCTAssert(date.second == 30)
    }
    
    func testSecond() {
        date.second = 40
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 9)
        XCTAssert(date.hour == 10)
        XCTAssert(date.minute == 9)
        XCTAssert(date.second == 40)
    }
    
    func testWeekday() {
        XCTAssert(date.weekday == 1)
    }
    
    func testInitYearMonthDayHourMinuteSecond() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail()
            return
        }
        
        XCTAssert(newDate.year == 2016)
        XCTAssert(newDate.month == 10)
        XCTAssert(newDate.day == 9)
    }
    
    func testInitParseFormat() {
        guard let parsed = Date(parse: "2016-10-09") else {
            XCTFail()
            return
        }
        
        XCTAssert(parsed.year == 2016)
        XCTAssert(parsed.month == 10)
        XCTAssert(parsed.day == 9)
    }
    
    func testInitDateTime() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail()
            return
        }
        guard let composed = Date(date: newDate, time: date) else {
            XCTFail()
            return
        }
        
        XCTAssert(composed.year == 2016)
        XCTAssert(composed.month == 10)
        XCTAssert(composed.day == 9)
        XCTAssert(composed.hour == 10)
        XCTAssert(composed.minute == 9)
    }
    
    func testDaysBetween() {
        guard let newDate = Date(year: 2016, month: 9, day: 9) else {
            XCTFail()
            return
        }
        let daysBetween = newDate.daysBetween(date)
        
        XCTAssert(daysBetween == 30)
    }
    
    func testIsToday() {
        let isToday = date.isToday()
        
        XCTAssertFalse(isToday)
    }
    
    func testIsSameDay() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail()
            return
        }
        let isSame = newDate.isSame(date)
        
        XCTAssertTrue(isSame)
    }
    
    func testAddingDays() {
        guard let dateAdded = date.addingDays(10) else {
            XCTFail()
            return
        }
        date = dateAdded
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 19)
    }
    
    func testAddDays() {
        date.addDays(10)
        
        XCTAssert(date.year == 2016)
        XCTAssert(date.month == 10)
        XCTAssert(date.day == 19)
    }
    
    func testYearString() {
        let year = date.yearString()
        
        XCTAssert(year == "2016")
    }
    
    func testShortDate() {
        let shortDate = date.shortDate()
        
        XCTAssert(shortDate.year == 2016)
        XCTAssert(shortDate.month == 10)
        XCTAssert(shortDate.day == 9)
    }
    
    func testIsGreaterThan() {
        guard let newDate = Date(year: 2016, month: 11, day: 9) else {
            XCTFail()
            return
        }
        let isGreaterThan = newDate.isGreaterThan(date)
        
        XCTAssertTrue(isGreaterThan)
    }
    
    func testIsLessThan() {
        guard let newDate = Date(year: 2016, month: 9, day: 9) else {
            XCTFail()
            return
        }
        let isLessThan = newDate.isLessThan(date)
        
        XCTAssertTrue(isLessThan)
    }
    
    func testIsEqual() {
        guard let newDate = Date(year: 2016, month: 10, day: 9) else {
            XCTFail()
            return
        }
        let isEqual = newDate.isEqual(date)
        
        XCTAssertTrue(isEqual)
    }
    
    func testYesterday() {
        let yesterday = date.yesterday()
        
        XCTAssert(yesterday.year == 2016)
        XCTAssert(yesterday.month == 10)
        XCTAssert(yesterday.day == 8)
    }
    
    func testDecriptionDateSeparatorUSFormatNanosecond() {
        let description = date.description(dateSeparator: "-", usFormat: false, nanosecond: false)
        
        XCTAssert(description == "10-09-2016 10:09:30")
    }
    
    #if !os(Linux)
        func testNanosecond() {
            XCTAssert(date.nanosecond == 0)
        }
    
        func testMonthsBetween() {
            guard let newDate = Date(year: 2016, month: 5, day: 9) else {
                XCTFail()
                return
            }
            let monthsBetween = newDate.monthsBetween(date)
            
            XCTAssert(monthsBetween == 5)
        }
    
        func testLocalizedWeekday() {
            let date = Date(timeIntervalSinceReferenceDate: 0)
            let localizedWeekday = date.localizedWeekday()
            
            XCTAssert(localizedWeekday == "Monday")
        }
        
        func testLocalizedMonth() {
            let date = Date(timeIntervalSinceReferenceDate: 0)
            let localizedMonth = date.localizedMonth()
            
            XCTAssert(localizedMonth == "January")
        }
    #endif
}
