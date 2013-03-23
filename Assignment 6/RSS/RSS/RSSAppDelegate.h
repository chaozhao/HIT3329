//
//  RSSAppDelegate.h
//  RSS
//
//  Created by Chao Zhao on 17/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RSSViewController;

@interface RSSAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet RSSViewController *viewController;

@end
