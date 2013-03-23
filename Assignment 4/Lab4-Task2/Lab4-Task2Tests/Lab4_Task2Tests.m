//
//  Lab4_Task2Tests.m
//  Lab4-Task2Tests
//
//  Created by Chao Zhao on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "Lab4_Task2Tests.h"
@implementation Lab4_Task2Tests

- (void)setUp
{
    [super setUp];
    app_delegate         = [[UIApplication sharedApplication] delegate];

}

- (void)tearDown
{
    [super tearDown];
}

- (void)testDelegate
{
    STAssertNotNil(app_delegate, @"Cannot find the application delegate");
}

- (void)testExample
{
    NSIndexPath *index = [NSIndexPath indexPathWithIndex:0];
    RootViewController *rootVC = [[RootViewController alloc]init];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell= [rootVC LoadGPSWithCell:cell atIndexPath:index];
    
    STAssertNotNil(cell, @"not nil");
    
    
    
}



@end
