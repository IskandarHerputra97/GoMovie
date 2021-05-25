//
//  AppDelegate.swift
//  GoMovie
//
//  Created by Iskandar Herputra Wahidiyat on 24/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showMainViewController()
        return true
    }
    
    //MARK: - Setup
    @objc private func showMainViewController() {
        if self.window == nil {
            self.window = UIWindow()
        }
        
        let landingPageVC: UIViewController = createNonLoginLandingPage()
        
        self.window?.rootViewController = landingPageVC
        self.window?.makeKeyAndVisible()
    }
    
    private func createNonLoginLandingPage() -> UIViewController {
        let landingPageViewController: UIViewController = HomeViewController()
        let navController: UINavigationController = UINavigationController(rootViewController: landingPageViewController)
        return navController
    }
}

