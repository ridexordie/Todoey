//
//  AppDelegate.swift
//  Todoey
//
//  Created by Tunc on 21.01.2018.
//  Copyright © 2018 Tunc. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL!)

        do {
            _ = try Realm()
        }catch {
            print("Error init realm, \(error)")
        }
        
        return true
    }

}

