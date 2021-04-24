//
//  UsersListViewModel.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/23/21.
//

import RxSwift
import RxCocoa

protocol UsersListViewModelProtocol {
  var rx_userNames: Observable<[String]> { get }
}

final class UsersListViewModel: UsersListViewModelProtocol {
  private var rx_usersFetched: Observable<[UserModel]>
  
  lazy var rx_userNames: Observable<[String]> = {
    return self.createUserNames(with: self.rx_usersFetched)
  }()
  
  private unowned let configService: ConfigServiceProtocol
  private let usersListService: UsersListServiceProtocol
  
  init(configService: ConfigServiceProtocol, usersListService: UsersListServiceProtocol) {
    self.configService = configService
    self.usersListService = usersListService
    self.rx_usersFetched = usersListService.fetchUsers(configService: configService)
  }
}

// observable constructors
extension UsersListViewModel {
  fileprivate func createUserNames(with usersFetched: Observable<[UserModel]>) -> Observable<[String]> {
    return usersFetched.flatMapLatest { users -> Observable<[String]> in
      let userNames = users.map{ $0.name }
      return Observable.just(userNames)
    }
  }
}
