//
//  AppDelegate.swift
//  CityU Pics
//
//  Created by Cali Castle  on 9/18/17.
//  Copyright © 2017 Cali Castle . All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        // Choose initial view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnboardingWelcome")
        window?.makeKeyAndVisible()
        
//        UILabel.appearance().substituteFontName = UIFont.defaultFontFamily
//        UITextField.appearance().substituteFontName = UIFont.defaultFontFamily
//        UITextView.appearance().substituteFontName = UIFont.defaultFontFamily
        
        return true
    }

}

