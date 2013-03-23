//
//  SpinCycleViewController.m
//  SpinCycle
//
//  Created by Mark Makdad on 6/9/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import "SpinCycleViewController.h"

// Private method declaration
@interface SpinCycleViewController ()
- (void) _runOperationShort:(BOOL)isShort;
@end

@implementation SpinCycleViewController

@synthesize operation;
@synthesize progressBar = _progressBar;
@synthesize activityIndicatorView = _activityIndicatorView;
@synthesize theTimer = _theTimer;
@synthesize fInterval;
@synthesize fNumber;
@synthesize shortOperationButton;
@synthesize longOperationButton;

#pragma mark - IBAction Methods

/**
 * Private method - if BOOL is YES, short, otherwise long.
 */
- (void) _runOperationShort:(BOOL)isShort
{
  // First, make sure there isn't one running.
  if (self.operation) 
  {
    [NSException raise:NSInternalInconsistencyException
                format:@"Your code should not allow more than 1 operation at a time."];
  }

  // Set up the object
  OperationSimulator *anOperation = [[OperationSimulator alloc] initWithDelegate:self];
  self.operation = anOperation;
  [anOperation release];
  
  if (isShort)
  {
    [self.operation startNewShortOperation];
  }
  else
  {
    [self.operation startNewLongOperation];
  }
}

- (IBAction) shortOperationButtonPressed:(id)sender
{
    [self _runOperationShort:YES];
    [_activityIndicatorView startAnimating];
    self.longOperationButton.enabled = NO;
}

- (IBAction) longProgressiveOperationButtonPressed:(id)sender
{
  // Passing NO makes it a long op
    [self _runOperationShort:NO];
    self.shortOperationButton.enabled = NO;
    _progressBar.progress = 0.0;
     _theTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(increase:) userInfo:nil repeats:YES];
}

#pragma mark - OperationSimulatorDelegate Callback Code

- (void) operationIsFinished:(OperationSimulator *)operation
{
  self.operation = nil;
  NSLog(@"Simulated operation finished!");
    self.longOperationButton.enabled = YES;
    self.shortOperationButton.enabled = YES;
    [_activityIndicatorView stopAnimating];
    [_theTimer invalidate];
    if(_progressBar.progress != 0.0)
    {
        _progressBar.progress = 1.0;
    }
}

#pragma mark - Your Code

-(void) viewDidLoad
{
    fNumber = 0.0;
    fInterval = 1.0/30.0;
    _progressBar.progress = 0.0;
}

-(void) increase:(NSTimer*)theTimer
{    
    fNumber = fNumber + fInterval;
    _progressBar.progress = fNumber;
    if(fNumber >1.0)
    {
        [theTimer invalidate];
    }
    NSLog(@"%4.2f/100 progress",fNumber*100);
}

#pragma mark - Class Plumbing

- (void)dealloc
{
  [operation release];
  [super dealloc];
}



@end
