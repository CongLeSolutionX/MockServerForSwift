//
//  ConfigService.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/24/21.
//

import Foundation

enum ConfigEnvironment {
  case Debug
  case Release
  case Tests
}

struct ConfigModel: Decodable {
  //  let apiURl: String
  var api_url: String
}

protocol ConfigServiceProtocol: AnyObject {
  var apiURL: String? {  get }
}

final class ConfigService: ConfigServiceProtocol {
  
  private let configEnv: ConfigEnvironment
  
  private lazy var configModel: ConfigModel? = {
    guard let fileNameString = ConfigHelper.json(for: self.configEnv) else { return nil }
    let data = fileNameString.data(using: .utf8)!
    
    let jsonData = try? JSONDecoder().decode(ConfigModel.self, from: data)
    return jsonData
    
  }()
  
  var apiURL: String? {
    return configModel?.api_url
  }
  
  init(configEnv: ConfigEnvironment) {
    self.configEnv = configEnv
  }
  
}
