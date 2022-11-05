//
//  FreeFinderMilestone3BTests.swift
//  FreeFinderMilestone3BTests
//
//  Created by Jordan Labuda on 11/2/22.
//

import XCTest
@testable import FreeFinderMilestone3B
import Firebase

class FreeFinderMilestone3BTests: XCTestCase {

    //FirebaseApp.configure()
    var ref: DatabaseReference!
    
    
    
    override func setUpWithError() throws {
        //FirebaseApp.configure()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_comment() throws{
        ref = Database.database(url: "https://freefinder-12f0c-default-rtdb.firebaseio.com/").reference().child("items")
        let test_user = User(id:"user1id", email:"jlabuda@uchicago.edu") //need user instance to test respective functions
        let item1 = "itemid1" //will be id of test data already in DB
        let item2 = "testitemid2" // id of item not in DB
        var firstComments: [String] = []
        //get initial state of db
        ref.child(item1).observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any]{
                let firstComments = data["comments"]
            }
        }){ (error) in print(error.localizedDescription)}
        
        // false: empty comment with no previous comments
        XCTAssertFalse(test_user.comment(item_id:item1,comment:""))
        ref.child(item1).observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any]{
                XCTAssertEqual(firstComments, data["comments"] as! [String])
            }
        }){ (error) in print(error.localizedDescription)}
        
        // true: good comment w/ no prior comments
        XCTAssertTrue(test_user.comment(item_id:item1,comment: "Hi"))
        firstComments.append("Hi")
        ref.child(item1).observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any]{
                XCTAssertEqual(firstComments, data["comments"] as! [String])
            }
        }){ (error) in print(error.localizedDescription)}
        
        // true: good comment w/ prior comments
        XCTAssertTrue(test_user.comment(item_id: item1,comment: "Hi2"))
        firstComments.append("Hi2")
        ref.child(item1).observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any]{
                XCTAssertEqual(firstComments, data["comments"] as! [String])
            }
        }){ (error) in print(error.localizedDescription)}
        
        // false: empty comment with prior comments
        XCTAssertFalse(test_user.comment(item_id: item1, comment: ""))
        ref.child(item1).observeSingleEvent(of: .value, with: { (snapshot) in
            if let data = snapshot.value as? [String: Any]{
                XCTAssertEqual(firstComments, data["comments"] as! [String])
            }
        }){ (error) in print(error.localizedDescription)}
        
        // false: comment on invalid item
        XCTAssertFalse(test_user.comment(item_id: item2, comment: "hi"))
        
    }

}
