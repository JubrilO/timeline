//
//  AppDelegate.swift
//  timeline
//
//  Created by Jubril Olambiwonnu on 12/03/2017.
//  Copyright © 2017 Jubril Olambiwonnu. All rights reserved.
//

import UIKit
import Locksmith

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var twitterQuery: String?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        UserDefaults.standard.register(defaults: ["UserAgent":"timeline-ios"])
        let currentCount = UserDefaults.standard.integer(forKey: "launchCount")
        if currentCount == 0{
            let _ = try? Locksmith.deleteDataForUserAccount(userAccount: "timelineUser")
        }
        UserDefaults.standard.set(currentCount+1, forKey:"launchCount")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tokenDict = Locksmith.loadDataForUserAccount(userAccount: "timelineUser")
        if let _ = tokenDict?["token"]{
            //let initialVC = storyboard.instantiateViewController(withIdentifier: "questionVC")
            let initialVC = PageViewController()
            self.window?.rootViewController = initialVC
            self.window?.makeKeyAndVisible()
        }
        else{
            let initialVC = storyboard.instantiateViewController(withIdentifier: "loginVC")
            self.window?.rootViewController = initialVC
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("reopening app")
        twitterQuery = url.query
        if let twitterQuery = twitterQuery{
            let index = twitterQuery.index(twitterQuery.startIndex, offsetBy: 6)
            let twitterToken = twitterQuery.substring(from: index)
            try! Locksmith.saveData(data: ["token" : twitterToken], forUserAccount: "timelineUser")
            let nc = NotificationCenter.default
            nc.post(name: tokenRetrievedNotification, object: nil)
        }
        return true
    }

}

