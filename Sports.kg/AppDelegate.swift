//
//  AppDelegate.swift
//  Sports.kg
//
//  Created by Eldiiar on 4/10/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let shared = AppDelegate()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let userDefaults = UserDefaultsService.shared
        
        if userDefaults.didSignedIn() {
            print("Yoo")
        }
        _ = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) {
            (_) in
            print("Get tokens")
         }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

extension AppDelegate {
    func overrideApplicationThemeStyle() {
        if #available(iOS 13.0, *) {
            // Retrieve your NSUserDefaults value here
            let userDefaults = UserDefaultsService.shared
            
            let theme = userDefaults.getApplicationTheme()

            userDefaults.saveApplicationTheme(theme: theme ? false : true)
            
            if userDefaults.getApplicationTheme() {
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .light
            } else {
                UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = .dark
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}
