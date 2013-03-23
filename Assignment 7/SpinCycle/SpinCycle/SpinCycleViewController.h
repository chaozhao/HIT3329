//
//  SpinCycleViewController.h
//  SpinCycle
//
//  Created by Mark Makdad on 6/9/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OperationSimulator.h"

@interface SpinCycleViewController : UIViewController <OperationSimulatorDelegate>

//! Connected to the "short operation" button on the interface
- (IBAction) shortOperationButtonPressed:(id)sender;

//! Connected to the "Download" button on the interface
- (IBAction) longProgressiveOperationButtonPressed:(id)sender;

@property (retain) OperationSimulator *operation;

@property(nonatomic,retain) IBOutlet UIProgressView *progressBar;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property(nonatomic,) NSTimer *theTimer;
@property(assign) CGFloat fInterval;
@property(assign) CGFloat fNumber;
@property(nonatomic,retain) IBOutlet IBOutlet UIButton *shortOperationButton;
@property(nonatomic,retain) IBOutlet IBOutlet UIButton *longOperationButton;
-(void) increase:(NSTimer*)theTimer;


@end
