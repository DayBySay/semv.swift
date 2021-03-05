import XCTest

import semver_swiftTests

var tests = [XCTestCaseEntry]()
tests += semver_swiftTests.allTests()
XCTMain(tests)
