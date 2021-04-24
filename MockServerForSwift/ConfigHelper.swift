//
//  ConfigHelper.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/24/21.
//

import Foundation

final class ConfigHelper {
  static var configEnv: ConfigEnvironment {
    #if DEBUG
    return .Debug
    #elseif RELEASE
    return .Release
    #elseif TESTS
    return .Tests
    #else
    fatalError("Config flag not found")
    #endif
  }
  
  static func json(for configEnv: ConfigEnvironment) -> String? {
    guard let file = jsonFile(for: configEnv) else { return nil }
    do {
      let fileReturned = try String(contentsOfFile: file)
      return fileReturned
    } catch (let error) {
      fatalError("Failed to get config file with error: \(error.localizedDescription)")
    }
  }
  
  private static func jsonFile(for configEnv: ConfigEnvironment) -> String? {
    var fileName: String? = nil
    switch configEnv {
    case .Debug:
      fileName = "Config-Debug"
    case .Release:
      fileName = "Config-Release"
    case .Tests:
      fileName = "Config-Test"
    }
    
    return Bundle.main.path(forResource: fileName, ofType: "json")
  }
}
