//
//  GPSCoordinateApplicationTests.m
//  GPSCoordinateApplicationTests
//
//  Created by Chao Zhao on 7/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GPSCoordinateApplicationTests.h"

@implementation GPSCoordinateApplicationTests

- (void)testExample
{
    NSIndexPath *index = [[NSIndexPath indexPathWithIndex:0];
    RootViewController *rootVC = [[RootViewController alloc]init];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell= [rootVC LoadGPSWithCell:cell atIndexPath:index];

    NSLog(@"cell output is %@",cell);
    UITableViewCell *cell2 = [[UITableViewCell alloc]init];
    cell2.textLabel.text = @"-27.99824106;153.42096322;2010-07-07 22:27:31";

    STAssertNotNil(cell, @"not nil");
    STAssertEqualObjects(cell,cell2,@"object not equal");
}

- (void)setUp
{
    [super setUp];
    app_delegate         = [[UIApplication sharedApplication] delegate];
    root_view_controller = app_delegate.navigationController;
    root_view            = root_view_controller.view;
}

- (void)tearDown
{
    [super tearDown];
}

@end
