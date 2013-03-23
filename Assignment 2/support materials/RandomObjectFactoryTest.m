//
//  RandomObjectFactoryTest.m
//  lab4
//
//  Created by Mark Makdad on 5/30/11.
//  Copyright 2011 Long Weekend Inc. All rights reserved.
//

#import "RandomObjectFactoryTest.h"


@implementation RandomObjectFactoryTest

/**
 * Randomly create 1000 objects and make sure we get one of every type
 */
- (void) testRandomObjects
{
  // Put string representations of all the classes we expect in the results here
  NSSet *expectedResult = [NSSet setWithObjects:@"NSString",@"NSDictionary",@"NSData",@"NSNumber",
                           @"UIColor",@"UIView",@"UIButton",@"UILabel",nil];
  
  NSMutableSet *actualResult = [NSMutableSet set];
  
  NSInteger iterations = 0;
  while (iterations < 1000)
  {
    id randomObj = [RandomObjectFactory randomNSObject];
    NSString *className = NSStringFromClass([randomObj class]);
    [actualResult addObject:className];
    iterations++;
  }
  
  STAssertTrue([expectedResult isEqualToSet:actualResult],@"Actual set: '%@' did not match expected '%@'",actualResult,expectedResult);
}

@end
