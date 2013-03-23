//
//  GPSCoordinateApplicationTests.h
//  GPSCoordinateApplicationTests
//
//  Created by Chao Zhao on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import "Lab4_Task2AppDelegate.h"
#import "RootViewController.h"
#import "MapViewController.h"



@interface GPSCoordinateApplicationTests : SenTestCase
{
@private
    Lab4_Task2AppDelegate    *app_delegate;
    UINavigationController *root_view_controller;
    UIView             *root_view;
    
}


@end
