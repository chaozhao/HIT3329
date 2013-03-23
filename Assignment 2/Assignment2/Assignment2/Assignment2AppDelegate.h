//
//  Assignment2AppDelegate.h
//  Assignment2
//
//  Created by Chao Zhao on 2/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Assignment2ViewController;

@interface Assignment2AppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Assignment2ViewController *viewController;

@end
