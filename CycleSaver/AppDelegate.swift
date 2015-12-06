//
//  AppDelegate.swift
//  CycleSaver
//
//  Created by Kathryn Killebrew on 11/7/15.
//  Copyright © 2015 Kathryn Killebrew. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var manager: CLLocationManager?
    
    lazy var coreDataStack = CoreDataStack()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        manager = CLLocationManager()
        manager?.requestAlwaysAuthorization()
        manager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        //manager?.allowsBackgroundLocationUpdates = true
        //manager?.allowDeferredLocationUpdatesUntilTraveled(<#T##distance: CLLocationDistance##CLLocationDistance#>, timeout: <#T##NSTimeInterval#>)
        
        let root = self.window!.rootViewController
        print("Root view controller is a: \(root?.description)")
        
        let navigationController = self.window!.rootViewController as! UINavigationController
        
        print("Nav controller is a: \(navigationController.description)")
        
        let tabController = navigationController.topViewController as! UITabBarController
        
        print("Tab controller: \(tabController.description)")
        
        let viewController = tabController.viewControllers?.first as! MapController
    
        
        print("View controller is a: \(viewController)")
        
        viewController.managedContext = coreDataStack.context
        
        let tripsController = tabController.viewControllers?.last as! TripListController
        
        tripsController.coreDataStack = coreDataStack
        
        print("managed context set!")

        return true
    }

    
    func applicationDidEnterBackground(application: UIApplication) {
        coreDataStack.saveContext()
    }
    
    func applicationWillTerminate(application: UIApplication) {
        coreDataStack.saveContext()
    }
}

