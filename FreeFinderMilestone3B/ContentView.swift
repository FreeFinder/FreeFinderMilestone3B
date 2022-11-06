//
//  ContentView.swift
//  FreeFinderMilestone3B
//
//  Created by Jordan Labuda on 11/2/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State var showCreateItemView: Bool = false
    
    var body: some View {
        StoryboardView().edgesIgnoringSafeArea(.all)
//        VStack {
//            if showCreateItemView {
//
//            } else {
//                Button("Create Item") {
//                    self.showCreateItemView = true
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct StoryboardView: UIViewControllerRepresentable{
    func makeUIViewController(context content: Context) -> UIViewController{
        let storyboard = UIStoryboard(name:"Home", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "TabBar")
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
    }
}
