import XCTest
import class Foundation.Bundle

final class semv_swiftTests: XCTestCase {
    
    func testMajorVersionIncrement() throws {
        AssertExecuteCommand(
          command: "semv 0.1.1 major",
          expected: "1.0.0",
          exitCode: .success)
    }
    
    func testMinorVersionIncrement() throws {
        AssertExecuteCommand(
          command: "semv 0.1.1 minor",
          expected: "0.2.0",
          exitCode: .success)
    }
    
    func testPatchVersionIncrement() throws {
        AssertExecuteCommand(
          command: "semv 0.1.1 patch",
          expected: "0.1.2",
          exitCode: .success)
    }
    
    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testMajorVersionIncrement", testMajorVersionIncrement),
        ("testMinorVersionIncrement", testMinorVersionIncrement),
        ("testPatchVersionIncrement", testPatchVersionIncrement),
    ]
}
