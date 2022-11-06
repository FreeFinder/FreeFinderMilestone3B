//
//  user.swift
//  FreeFinderMilestone3B
//
//  Created by Charlie Gravitt on 11/6/22.
//

import Foundation

@main
class User{
    var email: String?
    var ID: String?
    
    init(){
        email = nil
        ID = nil
    }
    
    func setEmail(e: String) -> Bool{
        if e.hasSuffix(".edu") {
            email = e
        }
        return e.hasSuffix(".edu")
    }
}
