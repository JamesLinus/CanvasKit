//
//  CK2Module.h
//  CanvasKit
//
//  Created by Jason Larsen on 9/11/13.
//  Copyright (c) 2013 Instructure. All rights reserved.
//

#import "CK2Model.h"

/**
 The module is locked due to module dependencies
 and/or until a further date.
 */
extern NSString * const CK2ModuleStateLocked;
/**
 The module is in an unlocked, but not yet started state.
 */
extern NSString * const CK2ModuleStateUnlocked;
/**
 The module is unlocked and some progress has been made.
 */
extern NSString * const CK2ModuleStateStarted;
/**
 All requirements in the module have been completed.
 */
extern NSString * const CK2ModuleStateCompleted;

/**
 The current workflow of the module is active.
 */
extern NSString * const CK2ModuleWorkflowStateActive;
/**
  The current workflow of the module is deleted.
 */
extern NSString * const CK2ModuleWorkflowStateDeleted;

@interface CK2Module : CK2Model

/**
 The state of this Module for the calling user: locked,
 unlocked, started, or completed.
 
 @see
 */
@property (nonatomic, copy) NSString *state;

/**
 The state of the module: active or deleted.
 
 @see CK2ModuleWorkflowStateActive, CK2ModuleWorkflowStateDeleted
 */
@property (nonatomic, copy) NSString *workflowState;

/**
 The name of the module.
 */
@property (nonatomic, copy) NSString *name;

/**
 The date at which the module unlocks, if it locked till a certain
 date.
 */
@property (nonatomic, strong) NSDate *unlockAt;

/**
 Items in the module must be unlocked in sequential order.
 */
@property (nonatomic) BOOL requireSequentialProgress;

/**
 The number of module items in the module.
 */
@property (nonatomic) NSUInteger itemsCount;

/**
 The module's items. An array of CK2ModuleItem.
 
 @see CK2ModuleItem
 @warning The count of this array may not match match itemsCount.
 If this is the case, you have not loaded all the items yet.
 */
@property (nonatomic, copy) NSArray *items;

/**
 The API URL of the module items for the module.
 */
@property (nonatomic, strong) NSURL *itemsAPIURL;

/**
 The date the module was completed on, if completed.
 */
@property (nonatomic, strong) NSDate *completedAt;

@end
