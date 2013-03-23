//
//  SpinCycleAppDelegate.h
//  SpinCycle
//
//  Created by Mark Makdad on 6/9/11.
//  Copyright 2011 Long Weekend LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SpinCycleViewController;

@interface SpinCycleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet SpinCycleViewController *viewController;

@end
