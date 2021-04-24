//
//  UsersListService.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/24/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol UsersListServiceProtocol {
  func fetchUsers(configService: ConfigServiceProtocol) -> Observable<[UserModel]>
}

final class UsersListService: UsersListServiceProtocol {
  
  func fetchUsers(configService: ConfigServiceProtocol) -> Observable<[UserModel]> {
    guard let apiURL = configService.apiURL else {
      let error = NSError(domain: "APIUrlNotSet", code: 0, userInfo: nil)
      return Observable.error(error)
    }
    
    let url = apiURL + "users"
    let request = URLRequest(url: URL(string: url)! )
    
    return URLSession.shared.rx.json(url: request)
   
    
  }
}
