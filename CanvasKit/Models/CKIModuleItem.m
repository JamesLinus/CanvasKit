//
//  CKIModuleItem.m
//  CanvasKit
//
//  Created by Jason Larsen on 9/11/13.
//  Copyright (c) 2013 Instructure. All rights reserved.
//

#import "CKIModuleItem.h"
#import "CKIModule.h"

#import "NSValueTransformer+CKIPredefinedTransformerAdditions.h"
#import "NSDictionary+DictionaryByAddingObjectsFromDictionary.h"

NSString * const CKIModuleItemTypeFile = @"File";
NSString * const CKIModuleItemTypePage = @"Page";
NSString * const CKIModuleItemTypeDiscussion = @"Discussion";
NSString * const CKIModuleItemTypeAssignment = @"Assignment";
NSString * const CKIModuleItemTypeQuiz = @"Quiz";
NSString * const CKIModuleItemTypeSubHeader = @"SubHeader";
NSString * const CKIModuleItemTypeExternalURL = @"ExternalUrl";
NSString * const CKIModuleItemTypeExternalTool = @"ExternalTool";

NSString * const CKIModuleItemCompletionRequirementMustView = @"must_view";
NSString * const CKIModuleItemCompletionRequirementMustSubmit = @"must_submit";
NSString * const CKIModuleItemCompletionRequirementMustContribute = @"must_contribute";
NSString * const CKIModuleItemCompletionRequirementMinimumScore = @"min_score";

@interface CKIModuleItem ()

@end

@implementation CKIModuleItem

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    NSDictionary *keyPaths = @{
        @"contentID": @"content_id",
        @"pageID": @"page_url",
        @"htmlURL": @"html_url",
        @"apiURL": @"url",
        @"externalURL": @"external_url",
        @"completionRequirement": @"completion_requirement.type",
        @"minimumScore": @"completion_requirement.min_score",
        @"completed": @"completion_requirement.completed",
        @"pointsPossible": @"content_details.points_possible",
        @"dueAt": @"content_details.due_at",
        @"unlockAt": @"content_details.unlock_at",
        @"lockAt": @"content_details.lock_at"
    };
    NSDictionary *superPaths = [super JSONKeyPathsByPropertyKey];
    return [superPaths dictionaryByAddingObjectsFromDictionary:keyPaths];
}

+ (NSValueTransformer *)contentIDJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:CKINumberStringTransformerName];
}

+ (NSValueTransformer *)htmlURLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)apiURLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)externalURLJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)dueAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:CKIDateTransformerName];
}

+ (NSValueTransformer *)unlockAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:CKIDateTransformerName];
}

+ (NSValueTransformer *)lockAtJSONTransformer
{
    return [NSValueTransformer valueTransformerForName:CKIDateTransformerName];
}

- (NSString *)itemID
{
    return self.contentID ?: self.pageID;
}

- (NSString *)path
{
    return [[self.context.path stringByAppendingPathComponent:@"items"] stringByAppendingPathComponent:self.id];
}
@end
