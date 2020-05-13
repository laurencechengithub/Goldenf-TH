//
//  AppDelegate.swift
//  ThunderFire
//
//  Created by laurenceSecuNet on 4/6/20.
//  Copyright © 2020 laurenceSecuNet. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    var navi:UINavigationController?
    
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor.clear
        
        //navi bar title
        navigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        //set status bar to white
        UIApplication.shared.statusBarStyle = .lightContent
        
//        let barButtonItem = UIBarButtonItem.appearance()
//        barButtonItem.setBackgroundImage(UIImage(named: "iconBlack"), for: .normal, barMetrics: .default)
        
        
//        var statusBarHeight: CGFloat = 0
//         if #available(iOS 13.0, *) {
//             statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
//         } else {
//             statusBarHeight = UIApplication.shared.statusBarFrame.height
//         }
        
        
        
        // tobe finished for navigation Manager
//        if let window = window {
            //set enterPointVC as root view controller of UINavigationController
//            let enterPointVC = EnterPointViewController()
//            navi = UINavigationController(rootViewController: enterPointVC)
//            window.rootViewController = navi
//            window.makeKeyAndVisible()
//        }


        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.deleteCookies()
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

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "ThunderFire")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

extension AppDelegate {
    
    func deleteCookies() {

        let cookieStorage = HTTPCookieStorage.shared
        let cookies = cookieStorage.cookies as! [HTTPCookie]
        
        for cookie in cookies {
            print("name: \(cookie.name) value: \(cookie.value)")
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
        print("Remain Cookies.count: \(cookies.count)")
        
    }
    
}

