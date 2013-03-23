//
//  CoordinatesTest.h
//  CoordinatesTest
//
//  Created by Chao Zhao on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "Lab4_Task2AppDelegate.h"
#import "RootViewController.h"
#import "MapViewController.h"
#import "DisplayMap.h"


@interface CoordinatesTest : SenTestCase
{
@private     
    MapViewController *mapView;
    MKCoordinateRegion region;
}

@end
