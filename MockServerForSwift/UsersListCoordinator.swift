//
//  UsersListCoordinator.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/23/21.
//

import UIKit

final class UserListCoordinator: Coordinator {
  
  private unowned let navigationController: UINavigationController
  private unowned let configService: ConfigServiceProtocol
  
  init(navigationController: UINavigationController, configService:ConfigServiceProtocol) {
    self.navigationController = navigationController
    self.configService = configService
  }
  
  func start() {
    let usersListService = UsersListService()
    let viewModel = UsersListViewModel(configService: configService, usersListService: usersListService)
    let view = UsersListTableViewController()
    navigationController.pushViewController(view, animated: true)
  }
}
