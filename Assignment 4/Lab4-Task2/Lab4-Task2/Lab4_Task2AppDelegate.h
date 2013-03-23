//
//  Lab4_Task2AppDelegate.h
//  Lab4-Task2
//
//  Created by Chao Zhao on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lab4_Task2AppDelegate : NSObject <UIApplicationDelegate>
{
    UIWindow               *window;
    UINavigationController *rootViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
