//
//  HoneymoonApp.swift
//  Honeymoon
//
//  Created by Saad Tahir on 23/05/2024.
//

import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    return true
  }
}


@main
struct HoneymoonApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {}
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}
