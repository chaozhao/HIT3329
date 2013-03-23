//
//  OperationSimulator.m
//  SpinCycle
//
//  Created by Mark Makdad on 6/9/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import "OperationSimulator.h"

// Private method declaration
@interface OperationSimulator ()
- (void) _startOperation:(NSTimeInterval)seconds;
- (void) _finished;
@end

@implementation OperationSimulator
@synthesize delegate;

#pragma mark -
#pragma mark Public Interface

- (id) initWithDelegate:(id<OperationSimulatorDelegate>)theDelegate
{
  self = [super init];
  if (self)
  {
    self.delegate = theDelegate;
    _inOperation = NO;
    _operationTime = 0;
    _operationStartTime = nil;
  }
  return self;
}

- (void) startNewShortOperation
{
  _operationTime = 2.5;
  [self _startOperation:_operationTime];
}

- (void) startNewLongOperation
{
  _operationTime = 30.0;
  [self _startOperation:_operationTime];
}

- (CGFloat) progress
{
  CGFloat progressVal = 0.0f;
  
  // Only check progress if we're doing something
  if (_operationStartTime && _operationTime > 0)
  {
    NSTimeInterval elapsed = [[NSDate date] timeIntervalSinceDate:_operationStartTime];
    progressVal = (elapsed / _operationTime);
  }
  return progressVal;
}

#pragma mark -
#pragma mark Private Methods

// Private helper for starting op
- (void) _startOperation:(NSTimeInterval)seconds
{
  NSLog(@"Beginning operation with approximate length of %d seconds.",(NSInteger)seconds);
  _operationStartTime = [[NSDate date] retain];
  [self performSelector:@selector(_finished) withObject:nil afterDelay:seconds];
}

// Private helper for calling back to view controller
- (void) _finished
{
  _inOperation = NO;
  _operationTime = 0;
  
  // Clean up memory AND nil out (otherwise this can crash in dealloc)
  [_operationStartTime release];
  _operationStartTime = nil;
  
  // Callback to the delegate if it responds to our protocol method
  if (self.delegate && [self.delegate respondsToSelector:@selector(operationIsFinished:)])
  {
    [self.delegate operationIsFinished:self];
  }
}

- (void) dealloc
{
  // Cancel out any simulated waits we had.
  [NSObject cancelPreviousPerformRequestsWithTarget:self];
  
  // Only release if we were in the middle of something
  if (_operationStartTime)
  {
    [_operationStartTime release];
  }
  
  [super dealloc];
}

@end
