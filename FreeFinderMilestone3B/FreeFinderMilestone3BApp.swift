//
//  FreeFinderMilestone3BApp.swift
//  FreeFinderMilestone3B
//
//  Created by Jordan Labuda on 11/2/22.
//

import SwiftUI
import Firebase
import FirebaseCore


func refresh(){
    
}

func item_to_annot(item_id: String){
    
}

func sign_in(){
    
}

class User {
    var id : String
    var email : String
    
    init(id: String, email: String){
        self.id = id
        self.email = email
    }
    
    func create_item(){
        
    }
    func comment(item_id: String, comment: String)-> Bool{
        return false
    }
    func delete_item(item_id: String){
        
    }
    func sign_out(){
        
    }
    
}

@main
struct FreeFinderApp: App {
    //var ref: DatabaseReference!
    //ref = Database.database(url: "https://freefinder-12f0c-default-rtdb.firebaseio.com/").reference()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            FirebaseApp.configure()
            
            return true
    }
}


