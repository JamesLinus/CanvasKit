//
//  CKIExternalToolTests.swift
//  CanvasKit
//
//  Created by Nathan Lambson on 7/9/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

import XCTest

class CKIExternalToolTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJSONModelConversion() {
        let externalToolDictionary = Helpers.loadJSONFixture("external_tool") as NSDictionary
        let extTool = CKIExternalTool(fromJSONDictionary: externalToolDictionary)
        
        XCTAssertEqual(extTool.consumerKey!, "test", "External Tool consumer key was not parsed correctly")
        XCTAssertEqual(extTool.description!, "This example LTI Tool Provider supports LIS Outcome pass-back and the content extension.", "External Tool description was not parsed correctly")
        XCTAssertEqual(extTool.id!, "24506", "External Tool id was not parsed correctly")
        XCTAssertEqual(extTool.name!, "LTI Test Tool", "External Tool name was not parsed correctly")
        XCTAssertEqual(extTool.privacyLevel!, "public", "External Tool privacyLevel was not parsed correctly")
        
        let formatter = ISO8601DateFormatter()
        formatter.includeTime = true
        var date = formatter.dateFromString("2013-07-29T21:28:47Z")
        XCTAssertEqual(extTool.createdAt!, date, "External Tool createdAt date was not parsed correctly")
        date = formatter.dateFromString("2013-07-29T21:28:47Z")
        XCTAssertEqual(extTool.updatedAt!, date, "External Tool updatedAt was not parsed correctly")
        
        var url = NSURL.URLWithString("lti-tool-provider.herokuapp.com")
        XCTAssertEqual(extTool.domain!, url, "External Tool domain was not parsed correctly")
        url = NSURL.URLWithString("http://lti-tool-provider.herokuapp.com/lti_tool")
        XCTAssertEqual(extTool.url!, url, "External Tool url was not parsed correctly")
        url = NSURL.URLWithString("http://lti-tool-provider.herokuapp.com/lti_tool/help")
        XCTAssertEqual(extTool.vendorHelpLink!, url, "External Tool vendorHelpLink was not parsed correctly")
        url = NSURL.URLWithString("http://lti-tool-provider.herokuapp.com/selector.png")
        XCTAssertEqual(extTool.iconURL!, url, "External Tool iconURL was not parsed correctly")
        
        var customFields = ["key": "value", "key2": "value2"]
        XCTAssertEqual(extTool.customFields.count, 2, "External Tool customFields was not parsed correctly")
        XCTAssertEqual(extTool.workflowState!, "public", "External Tool workflowState was not parsed correctly")
        XCTAssertEqual(extTool.path!, "/api/v1/external_tools/24506", "External Tool path was not parsed correctly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
