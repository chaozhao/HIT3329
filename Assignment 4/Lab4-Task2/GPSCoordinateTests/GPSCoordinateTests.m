//
//  GPSCoordinateTests.m
//  GPSCoordinateTests
//
//  Created by Chao Zhao on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GPSCoordinateTests.h"

@implementation GPSCoordinateTests

- (void)testExample
{
    GPSCoordinate *gc = [[GPSCoordinate alloc]init];
    [gc loadGPS];
    NSArray *testArray = gc.textArray;
    NSString *text1 = nil;
    NSString *text2 = nil;
    NSString *time = nil;
    NSArray *eachLineArray = [[NSArray alloc]init];
    
    for (NSString *eachLine in testArray) 
    {
        eachLineArray = [eachLine componentsSeparatedByString:@";"];
        
        text1 = [eachLineArray objectAtIndex:0];
        text2 = [eachLineArray objectAtIndex:1];
        time  = [eachLineArray objectAtIndex:2];
        NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        NSNumber *Latitude = [formatter numberFromString:text1];
        NSNumber *Longitude = [formatter numberFromString:text2];
        
        STAssertNotNil(Latitude, @"Latitude is nil");
        STAssertNotNil(Longitude,@"Longitude is nil"); 
        STAssertTrue([Latitude floatValue] <= 180.0, @"Latitude greater than 180");
        STAssertTrue([Latitude floatValue] >= -180.0, @"Latitude less than -180");
        STAssertTrue([Longitude floatValue] <= 180.0, @"Longitude greater than 180");
        STAssertTrue([Longitude floatValue] >= -180.0, @"Longitude less than -180");
    }
}
- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}
@end
