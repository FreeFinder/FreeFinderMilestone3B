//
//  FreeFinderMilestone3BApp.swift
//  FreeFinderMilestone3B
//
//  Created by Jordan Labuda on 11/2/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

func item_to_annot(item_id: String){
    var ref = Database.database(url: "https://freefinder-12f0c-default-rtdb.firebaseio.com/").reference()
    var itemInfo = ref.child("items/\(item_id)").getData(completion:  { error, snapshot in
      guard error == nil else {
        print(error!.localizedDescription)
        return;
      }
      let userName = snapshot.value as? String ?? "Unknown";
    });
    let json = try? JSONSerialization.jsonObject(with: itemInfo, options: [])
    
}

class Item {
    var id : String
    var title : String
    var description : String
    var photo : [[Int]]
    var quantity : Int
    var comments : [String]
}

@main
struct FreeFinderMilestone3BApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
