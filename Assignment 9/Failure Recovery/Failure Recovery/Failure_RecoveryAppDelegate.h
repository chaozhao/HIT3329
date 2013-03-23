//
//  Failure_RecoveryAppDelegate.h
//  Failure Recovery
//
//  Created by Chao Zhao on 31/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Failure_RecoveryViewController;

@interface Failure_RecoveryAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Failure_RecoveryViewController *viewController;

@end
