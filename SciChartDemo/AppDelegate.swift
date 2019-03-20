//
//  AppDelegate.swift
//  SciChartDemo
//
//  Created by Admin on 04/03/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import SciChart

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let LicenceKey = """
<LicenseContract>
<Customer>APA Sp. z o.o.</Customer>
<OrderId>ABT190306-5270-14112</OrderId>
<LicenseCount>1</LicenseCount>
<IsTrialLicense>false</IsTrialLicense>
<SupportExpires>01/16/2019 00:00:00</SupportExpires>
<ProductCode>SC-IOS-ANDROID-2D-PRO</ProductCode>
<KeyCode>2b711026d62f6eedd8c643410c9a3b22f76baa3e253cc8eff3b19a5a838054829b31d68ad2ac995e7ad42c03961dccdc18197d8caeaf512c71df7885dbc65657aab2773e9564166fc2381038df46e7fb66930ec0b040966795bf2a17a1b277d1f8909dddc26b3f53060a1766d5a0ef90c61991ca1cd5cd26736e85a2092230b9ee9de3c96fe0bda8131e968348425b1a14b92bd23ec199cbd72e04f195b54aa1048144f9f260b0af420e99b2f32449</KeyCode>
</LicenseContract>
"""


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        SCIChartSurface.setRuntimeLicenseKey(LicenceKey)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

