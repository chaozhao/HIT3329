//
//  Lab3_Task3ViewController.m
//  Lab3-Task3
//
//  Created by 6555985 on 27/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Lab3_Task3ViewController.h"

@implementation Lab3_Task3ViewController

@synthesize listData =_listData;
@synthesize tableView = _tableView;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableIdentifier = @"name";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    if (cell == nil) 
    {
        cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableIdentifier] autorelease];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [_listData objectAtIndex:row];
    return cell;
}

- (void)dealloc
{
    [_listData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

NSInteger compareLastNameByAscending(id name1, id name2, void * context)
{
    NSString *value1 = (NSString*) name1;
    NSString *value2 = (NSString*) name2;
    NSArray *arrayName1 =  [value1 componentsSeparatedByString:@" "];
    NSArray *arrayName2 =  [value2 componentsSeparatedByString:@" "];
    
    NSString *lastName1 = [[NSString alloc]init];
    NSString *lastName2 = [[NSString alloc]init];
    if([arrayName1 count] == 3)
    {
        lastName1 =[arrayName1 objectAtIndex:2];
    }
    else
    {
        lastName1 =[arrayName1 objectAtIndex:1];
    }
    if([arrayName2 count] == 3)
    {
        lastName2 =[arrayName2 objectAtIndex:2];
    }
    else
    {
        lastName2 =[arrayName2 objectAtIndex:1];
    }
    
    NSComparisonResult res = [lastName1 compare:lastName2];
    switch (res) 
    {
        case NSOrderedAscending:
            return NSOrderedAscending;
            break;
        case NSOrderedSame:
            return NSOrderedSame;
            break;
        case NSOrderedDescending:
            return NSOrderedDescending;
            break;
        default:
            break;
    }
}

NSInteger compareLastNameByDescending(id name1, id name2, void * context)
{
    NSString *value1 = (NSString*) name1;
    NSString *value2 = (NSString*) name2;
    
    NSArray *arrayName1 =  [value1 componentsSeparatedByString:@" "];
    NSArray *arrayName2 =  [value2 componentsSeparatedByString:@" "];
    NSString *lastName1 = [[[NSString alloc]init] autorelease];
    NSString *lastName2 = [[[NSString alloc]init] autorelease];
    //check if somebody's name has three names,use last one,not second name
    if([arrayName1 count] == 3)
    {
        lastName1 =[arrayName1 objectAtIndex:2];
    }
    else
    {
        lastName1 =[arrayName1 objectAtIndex:1];
    }
    
    if([arrayName2 count] == 3)
    {
        lastName2 =[arrayName2 objectAtIndex:2];
    }
    else
    {
        lastName2 =[arrayName2 objectAtIndex:1];
    }
    
    NSComparisonResult res = [lastName1 compare:lastName2];
    
    switch (res) 
    {
        case NSOrderedAscending:
            return NSOrderedDescending;
            break;
        case NSOrderedSame:
            return NSOrderedSame;
            break;
        case NSOrderedDescending:
            return NSOrderedAscending;
            break;
        default:
            break;
    }
}

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"actors_list" ofType:@"txt"];
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]; 
    self.listData = [contents componentsSeparatedByString:@"\n"]; 
    self.listData = [_listData sortedArrayUsingFunction:compareLastNameByAscending context:nil];
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}
- (void)viewWillAppear:(BOOL)animated 
{

}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if(self.interfaceOrientation ==  UIInterfaceOrientationPortraitUpsideDown)
    {  
        self.listData = [_listData sortedArrayUsingFunction:compareLastNameByAscending context:nil];
    }
    else if(self.interfaceOrientation == UIInterfaceOrientationPortrait)
    {
		self.listData = [_listData sortedArrayUsingFunction:compareLastNameByAscending context:nil];
    }
    else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft)
    {
        self.listData = [_listData sortedArrayUsingFunction:compareLastNameByDescending context:nil];
    }
    else if(self.interfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        self.listData = [_listData sortedArrayUsingFunction:compareLastNameByDescending context:nil];
    }
    [self.tableView reloadData];
}


@end
