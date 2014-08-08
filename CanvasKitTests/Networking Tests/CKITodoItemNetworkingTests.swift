//
//  CKITodoItemNetworkingTests.swift
//  CanvasKit
//
//  Created by Nathan Lambson on 7/29/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

import XCTest

class CKITodoItemNetworkingTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testFetchTodoItemsForCourse() {
        let courseDictionary = Helpers.loadJSONFixture("course") as NSDictionary
        let course = CKICourse(fromJSONDictionary: courseDictionary)
        let client = MockCKIClient()

        client.fetchTodoItemsForCourse(course)
        XCTAssertEqual(client.capturedPath!, "/api/v1/courses/1/todo", "CKITodoItem returned API path for testFetchTodoItemsForCourse was incorrect")
    }

    func testFetchTodoItemsForCurrentUser() {
        let client = MockCKIClient()

        client.fetchTodoItemsForCurrentUser()
        XCTAssertEqual(client.capturedPath!, "/api/v1/users/self/todo", "CKITodoItem returned API path for testFetchTodoItemsForCurrentUser was incorrect")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
