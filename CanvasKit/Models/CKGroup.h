//
//  CKGroup.h
//  CanvasKit
//
//  Created by Jason Larsen on 10/1/13.
//  Copyright (c) 2013 Instructure. All rights reserved.
//

#import "CKModel.h"

extern NSString * const CKGroupJoinLevelParentContextAutoJoin;
extern NSString * const CKGroupJoinLevelParentContextRequest;
extern NSString * const CKGroupJoinLevelInvitationOnly;

@interface CKGroup : CKModel

/**
 Plain text description of the group.
 */
@property (nonatomic, copy) NSString *groupDescription;

/**
 The group is public. Only Community groups can be public.
 @warning Once made public, a group cannot be made private.
 */
@property (nonatomic) BOOL isPublic;

/**
 The current user is following this group.
 */
@property (nonatomic) BOOL followedByUser;

/**
 How people are allowed to join the group. For all groups
 except community groups, the user must share the group's
 parent course account.  For student organized or community
 groups, where a can be a member of as many or few as they
 want, the levels are "parent_context_auto_join", 
 "parent_context_request", "invitation_only".  For class
 groups, where students are divided and should only be part
 of one group of the category, this will always be 
 "invitation_only", and is not relevant.
 
 @see CKGroupJoinLevelParentContextAutoJoin
 @see CKGroupJoinLevelParentContextRequest
 @see CKGroupJoinLevelInvitationOnly
 */
@property (nonatomic, copy) NSString *joinLevel;

/**
 The number of members in the group.
 */
@property (nonatomic) NSUInteger membersCount;

/**
 The URL of the group's avatar.
 */
@property (nonatomic, strong) NSURL *avatarURL;

/**
 The ID of the course this group belongs to.
 
 @note group can also belong to account, but this is not yet supported. TODO.
 */
@property (nonatomic, copy) NSString *courseID;

@end
