//
//  CKIModuleTests.swift
//  CanvasKit
//
//  Created by Nathan Lambson on 7/16/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

import XCTest

class CKIModuleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJSONModelConversion() {
        let moduleDictionary = Helpers.loadJSONFixture("module") as NSDictionary
        let module = CKIModule(fromJSONDictionary: moduleDictionary)
        
        XCTAssertEqual(module.id!, "123", "Module id was not parsed correctly")
        XCTAssertEqual(module.state!, "started", "Module state was not parsed correctly")
        XCTAssertEqual(module.workflowState!, "active", "Module workflow_state was not parsed correctly")
        XCTAssertEqual(module.name!, "Imaginary Numbers and You", "Module Imaginary Numbers and You was not parsed correctly")
        
        let formatter = ISO8601DateFormatter()
        formatter.includeTime = true
        var date = formatter.dateFromString("2012-12-31T06:00:00-06:00")
        
        XCTAssertEqual(module.unlockAt!, date, "Module unlockAt was not parsed correctly")
        XCTAssert(module.requireSequentialProgress, "Module requireSequentialProgress was not parsed correctly")
        
        XCTAssertEqual(module.itemsCount, 10, "Module itemsCount was not parsed correctly")
        
        XCTAssertNotNil(module.items, "Module items was not parsed correctly")
        
        let url = NSURL.URLWithString("https://canvas.example.com/api/v1/modules/123/items")
        XCTAssertEqual(module.itemsAPIURL!, url, "Module itemAPIURL was not parsed correctly")
        
        date = formatter.dateFromString("2012-12-31T06:00:00-06:00")
        XCTAssertEqual(module.completedAt!, date, "Module completedAt was not parsed correctly")
        XCTAssertEqual(module.prerequisiteModuleIDs.count, 2, "Module prerequisiteModuleIDs was not parsed correctly")
        
        XCTAssertEqual(module.path!, "/api/v1/modules/123", "Module path was not parsed correctly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
