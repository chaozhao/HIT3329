//
//  CrashAndBurnAppDelegate.h
//  CrashAndBurn
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend LLC, All rights reserved.
//

#import <UIKit/UIKit.h>

@class CrashAndBurnViewController;

@interface CrashAndBurnAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CrashAndBurnViewController *viewController;

@end
