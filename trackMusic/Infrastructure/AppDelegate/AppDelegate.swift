//
//  AppDelegate.swift
//  trackMusic
//
//  Created by Douglas  Goulart Nunes on 11/09/19.
//  Copyright © 2019 Douglas Nunes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.initImageCache()

    return true
  }

  // MARK: - Private methods
  
  fileprivate func initImageCache() {
    // Define memory cache
    let memoryCapacity = 500 * 1024 * 1024
    // Define disk cache
    let diskCapacity = 500 * 1024 * 1024
    // Config the cache params
    let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "pathImage")
    
    URLCache.shared = cache
  }

}
