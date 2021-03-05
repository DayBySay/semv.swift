import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(semver_swiftTests.allTests),
    ]
}
#endif
