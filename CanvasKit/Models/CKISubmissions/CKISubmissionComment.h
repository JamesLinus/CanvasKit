//
//  CKISubmissionComment.h
//  CanvasKit
//
//  Created by Jason Larsen on 9/8/13.
//  Copyright (c) 2013 Instructure. All rights reserved.
//

#import "CKIModel.h"

@class CKIUser;

@interface CKISubmissionComment : CKIModel

/**
 The comment text.
 */
@property (nonatomic, copy) NSString *comment;

/**
 The date the comment was made;
 */
@property (nonatomic, strong) NSDate *createdAt;

/**
 The Canvas user ID of the author of the comment.
 */
@property (nonatomic, copy) NSString *authorID;

/**
 The name of the comment's author.
 */
@property (nonatomic, copy) NSString *authorName;

@end
