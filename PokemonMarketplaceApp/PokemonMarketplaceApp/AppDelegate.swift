//
//  AppDelegate.swift
//  PokemonMarketplaceApp
//
//  Created by Muhammad Osama Naeem on 1/21/22.
//

import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
