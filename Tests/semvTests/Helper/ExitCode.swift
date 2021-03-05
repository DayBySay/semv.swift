//
//  ExitCode.swift
//  TestHelpers
//
//  Created by Takayuki Sei on 2020/12/17.
//

import Foundation

public struct ExitCode: Error, RawRepresentable, Hashable {
  public var rawValue: Int32

  public init(_ code: Int32) {
    self.rawValue = code
  }
  
  public init(rawValue: Int32) {
    self.init(rawValue)
  }
  
  public static let success = ExitCode(EXIT_SUCCESS)
  
  public static let failure = ExitCode(EXIT_FAILURE)
  
#if os(Windows)
  public static let validationFailure = ExitCode(ERROR_BAD_ARGUMENTS)
#else
  public static let validationFailure = ExitCode(EX_USAGE)
#endif

  public var isSuccess: Bool {
    self == Self.success
  }
}
