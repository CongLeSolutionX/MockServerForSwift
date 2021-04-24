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
  var navigationController: UINavigationController?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    // Set up style
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemRed
    
    // Setup the view controllers
    let mainVC = ViewController()
    navigationController = UINavigationController(rootViewController: mainVC)
    window?.rootViewController = navigationController
    return true
  }
  
}


