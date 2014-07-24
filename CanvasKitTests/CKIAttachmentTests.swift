//
//  CKIAttachmentTests.swift
//  CanvasKit
//
//  Created by Nathan Lambson on 7/21/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

import XCTest

class CKIAttachmentTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJSONModelConversion() {
        let attachmentDictionary = Helpers.loadJSONFixture("attachment") as NSDictionary
        let attachment = CKIAttachment(fromJSONDictionary: attachmentDictionary)
        
        XCTAssertEqual(attachment.id!, "43444064", "Attachment id did not parse correctly")
        XCTAssertEqual(attachment.contentType!, "image/jpeg", "Attachment contentType did not parse correctly")
        XCTAssertEqual(attachment.displayName!, "profilePic-1.jpg", "Attachment displayName did not parse correctly")
        XCTAssertEqual(attachment.fileName!, "profilePic.jpg", "Attachment fileName did not parse correctly")
        
        var url = NSURL.URLWithString("https://mobiledev.instructure.com/images/thumbnails/43444064/z5y5XR4cxQjd1VTvteYgdgp8M38eNcftbN7fG2UJ")
        XCTAssertEqual(attachment.URL!, url, "Attachment URL did not parse correctly")
        url = NSURL.URLWithString("https://instructure-uploads.s3.amazonaws.com/thumbnails/43444064/profilePic_thumb.jpg?AWSAccessKeyId=AKIAJBQ7MOX3B5WFZGBA&Expires=1406490315&Signature=j%2BFIlGfvzsLYUCVmNwwwZMrWNMY%3D")
        XCTAssertEqual(attachment.thumbnailURL!, url, "Attachment thumbnailURL did not parse correctly")
        
        XCTAssertEqual(attachment.size, 7105, "Attachment size did not parse correctly")

        let formatter = ISO8601DateFormatter()
        formatter.includeTime = true
        var date = formatter.dateFromString("2013-10-21T14:41:33Z")
//        XCTAssertEqual(attachment.updatedAt!, date, "Attachment updatedAt did not parse correctly")
        XCTAssertEqual(attachment.createdAt!, date, "Attachment createdAt did not parse correctly")
        XCTAssertNil(attachment.unlockAt, "Attachment unlockAt did not parse correctly")
        XCTAssertFalse(attachment.locked, "Attachment locked did not parse correctly")
        XCTAssertFalse(attachment.hidden, "Attachment hidden did not parse correctly")
        XCTAssertFalse(attachment.hiddenForUser, "Attachment hiddenForUser did not parse correctly")
        XCTAssertFalse(attachment.lockedForUser, "Attachment lockedForUser did not parse correctly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
