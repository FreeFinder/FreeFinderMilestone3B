//
//  FreeFinderMilestone3BApp.swift
//  FreeFinderMilestone3B
//
//  Created by Jordan Labuda on 11/2/22.
//

import SwiftUI
import GoogleSignIn
import user

var mainUser = User()

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // 1
        GIDSignIn.sharedInstance().clientID = "104716456050-t3omc9n9t4h98nb3o2mgkumd9kpvcs8u.apps.googleusercontent.com"
        // 2
        GIDSignIn.sharedInstance().delegate = self
        // 3
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        if GIDSignIn != nil{
            let mail = GIDSignIn.currentUser.profile.email
            mainUser.setEmail(e: mail)
        }
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {

        return GIDSignIn.sharedInstance().handle(url)
    }
    
}

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        // Check for sign in error
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                print("The user has not signed in before or they have since signed out.")
            } else {
                print("\(error.localizedDescription)")
            }
            return
        }
    }
}

struct FreeFinderMilestone3BApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
