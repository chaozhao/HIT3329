//
//  CoordinatesTest.m
//  CoordinatesTest
//
//  Created by Chao Zhao on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoordinatesTest.h"

@implementation CoordinatesTest

- (void)setUp
{
    [super setUp];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gps_coords" ofType:@"csv"];
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]; 
    NSArray *listData = [contents componentsSeparatedByString:@"\n"]; 
    mapView.selectedRow = [listData objectAtIndex:0];

    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testValideCoordinates
{
    //set latitude and longitude 
    
    region = [mapView loadCoordinatesToRegion:region];
    
    //-27.99824106;
//	region.span.longitudeDelta = 0.5f;
//	region.span.latitudeDelta = 0.5f;
    MKCoordinateRegion theRegion =  { {0.0, 0.0 }, { 0.0, 0.0 }};
    theRegion.center.latitude = -27.99824106;
    theRegion.center.longitude = 153.42096322;
    
    NSNumber *numbeRegion = [[NSNumber alloc]initWithDouble:region.center.latitude] ;
    NSNumber *compareRegion = [[NSNumber alloc]initWithDouble:-27.99824106];

    //STAssertNotNil(&region, @"yes");
    STAssertEqualObjects(&region,&theRegion,@"object is different");
    
    
    
}

@end
