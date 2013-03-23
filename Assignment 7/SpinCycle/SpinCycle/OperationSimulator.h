//
//  OperationSimulator.h
//  SpinCycle
//
//  Created by Mark Makdad on 6/9/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class OperationSimulator;

/**
 * Protocol that we'll use for callbacks to the view
 * controller.
 */ 
@protocol OperationSimulatorDelegate <NSObject>

//! This method is called back once the operation is finished.
- (void) operationIsFinished:(OperationSimulator*)operation;

@end


@interface OperationSimulator : NSObject
{
  BOOL _inOperation;
  NSDate *_operationStartTime;
  NSTimeInterval _operationTime;
}

- (id) initWithDelegate:(id<OperationSimulatorDelegate>)delegate;

//! Starts an operation that takes 2-3 seconds
- (void) startNewShortOperation;

//! Starts an operation that takes ~30 seconds
- (void) startNewLongOperation;

//! Returns the current "progress" of the task, range from 0 to 1.
- (CGFloat) progress;

@property (assign) id<OperationSimulatorDelegate> delegate;

@end
