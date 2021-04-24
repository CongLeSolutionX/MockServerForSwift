//
//  AppDelegate.swift
//  MockServerForSwift
//
//  Created by Cong Le on 4/23/21.
//

import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  private var mainCoordinator: Coordinator?
  private var configService: ConfigService?
  
  private var navigationController: UINavigationController = {
    let navigationController =  UINavigationController()
    navigationController.navigationBar.isTranslucent = false
    return navigationController
  }()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Set up style
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemRed
    window?.rootViewController = navigationController
    
//    // Setup the view controllers
//    let mainVC = ViewController()
//    navigationController = UINavigationController(rootViewController: mainVC)
    
    self.configService = ConfigService(configEnv: ConfigHelper.configEnv)
    let coordinator = UserListCoordinator(navigationController: navigationController, configService: configService!)
    coordinator.start()
    
    mainCoordinator = coordinator
 
    return true
  }
  
}


