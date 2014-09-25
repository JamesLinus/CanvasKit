//
//  CKIClient+CKISubmissionRecord.h
//  CanvasKit
//
//  Created by Brandon Pluim on 9/5/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

#import <CanvasKit/CanvasKit.h>

@interface CKIClient (CKISubmissionRecord)

- (RACSignal *)fetchSubmissionRecordsForAssignment:(CKIAssignment *)assignment;
- (RACSignal *)updateGrade:(NSString *)gradeString forSubmissionRecord:(CKISubmission *)submission;
- (RACSignal *)addComment:(NSString *)comment forSubmissionRecord:(CKISubmission *)submission;

@end
