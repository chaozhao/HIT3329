//
//  GPSCoordinate.m
//  Lab4-Task2
//
//  Created by Chao Zhao on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GPSCoordinate.h"

@implementation GPSCoordinate

@synthesize textArray = _textArray;

- (void)loadGPS
{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"gps_coords" ofType:@"csv"];
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]; 
    _textArray = [contents componentsSeparatedByString:@"\n"];
}

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
    }
    return self;
}

@end
