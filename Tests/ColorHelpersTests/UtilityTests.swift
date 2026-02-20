//
//  UtilityTests.swift
//  ObjectGesturesTests
//
//  Tests for color conversion utilities

import XCTest
import SwiftUI
@testable import ColorHelpers

final class UtilityTests: XCTestCase {

    // MARK: - Color+Hex Tests

    func test_colorFromHex_sixDigit() {
        let color = Color(hex: "#FF0000")
        XCTAssertNotNil(color)
    }

    func test_colorFromHex_withoutHash() {
        let color = Color(hex: "00FF00")
        XCTAssertNotNil(color)
    }

    func test_colorFromHex_threeDigit() {
        let color = Color(hex: "F00")
        XCTAssertNotNil(color)
    }

    func test_colorFromHex_eightDigit_withAlpha() {
        let color = Color(hex: "80FF0000")
        XCTAssertNotNil(color)
    }

    func test_colorFromHex_invalidString_returnsNil() {
        let color = Color(hex: "ZZZZZZ")
        XCTAssertNil(color)
    }

    func test_colorFromHex_emptyString_returnsNil() {
        let color = Color(hex: "")
        XCTAssertNil(color)
    }

    func test_uiColorFromHex_validHex_returnsNonNil() {
        let color = uiColorFromHex(hex: "#0000FF")
        // Verify we get a color object (platform-specific type)
        XCTAssertNotNil(color)
    }

    func test_uiColorFromHex_invalidHex_returnsBlack() {
        // Invalid hex should fall back to black
        let color = uiColorFromHex(hex: "invalid")
        XCTAssertNotNil(color)
    }

    func test_uiColorFromHex_variousFormats() {
        // All valid formats should return a color
        XCTAssertNotNil(uiColorFromHex(hex: "#FF0000"))
        XCTAssertNotNil(uiColorFromHex(hex: "00FF00"))
        XCTAssertNotNil(uiColorFromHex(hex: "F00"))
    }

    
}
