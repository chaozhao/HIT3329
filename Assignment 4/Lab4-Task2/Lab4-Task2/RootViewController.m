//
//  RootViewController.m
//  Lab4-Task2
//
//  Created by Chao Zhao on 30/09/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "Lab4_Task2AppDelegate.h"
#import "MapViewController.h"


@implementation RootViewController

@synthesize listData =_listData;
@synthesize tableView = _tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Coordinates";
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gps_coords" ofType:@"csv"];
    NSString *contents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil]; 
    self.listData = [contents componentsSeparatedByString:@"\n"]; 

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listData count];
}

-(UITableViewCell*)LoadGPSWithCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *text1 = [[NSString alloc]init];
    NSString *text2 = [[NSString alloc]init];
    NSString *time = [[NSString alloc]init];
    NSArray *textArray = [[NSArray alloc]init];
    NSMutableString *coords = [[NSMutableString alloc]init];
    @try
    {
        textArray = [[_listData objectAtIndex:row] componentsSeparatedByString:@";"];
        text1 = [textArray objectAtIndex:0];
        text2 = [textArray objectAtIndex:1];
        time  = [textArray objectAtIndex:2];
        
        NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];

        NSNumber *Latitude = [formatter numberFromString:text1];
        NSNumber *Longitude = [formatter numberFromString:text2];
        
        if((Latitude != nil) && 
           ([Latitude floatValue] <= 180.0) && 
           ([Latitude floatValue] >= -180.0) &&  
           (Longitude != nil)  &&  
           ([Longitude floatValue] <= 180.0) &&
           ([Longitude floatValue] >= -180.0) )
        {
            //set title
            [coords appendString:text1];
            [coords appendString:@", "];
            [coords appendString:text2];
            cell.textLabel.text = coords;
            //set subtitle
            cell.detailTextLabel.text = time;
        }
    }
    @catch(NSException *e)
    {
        NSLog(@"Root View Controller Exception: %@",e);
    }
    return cell;
}

-(NSArray*) checkGPSAtIndex:(NSIndexPath *)indexPath
{    

    NSUInteger row = [indexPath row];
    NSString *text1 = [[NSString alloc]init];
    NSString *text2 = [[NSString alloc]init];
    NSString *time = [[NSString alloc]init];
    NSArray *textArray = [[NSArray alloc]init];
    NSMutableArray *errorArray = [[NSMutableArray alloc]init];

    [errorArray addObject:@" "];
    [errorArray addObject:@" "];
    [errorArray addObject:@" "];

    @try
    {
        textArray = [[_listData objectAtIndex:row] componentsSeparatedByString:@";"];
        text1 = [textArray objectAtIndex:0];
        text2 = [textArray objectAtIndex:1];
        time  = [textArray objectAtIndex:2];
        
        NSNumberFormatter *formatter = [[[NSNumberFormatter alloc] init] autorelease];
        [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
        
        NSNumber *Latitude = [formatter numberFromString:text1];
        NSNumber *Longitude = [formatter numberFromString:text2];
            
        if((Latitude != nil) && 
            ([Latitude floatValue] <= 180.0) && 
            ([Latitude floatValue] >= -180.0) &&  
            (Longitude != nil)  &&  
            ([Longitude floatValue] <= 180.0) &&
            ([Longitude floatValue] >= -180.0) )
        {
            return textArray;
        }
        else
        {
            return errorArray;
        }
    }
    @catch(NSException *e)
    {
        
        NSLog(@"Check GPS Exception: %@",e);
        return errorArray;
    }
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
     NSArray *tempArray = [[[NSArray alloc]init ]autorelease];
     NSMutableString *tempString =  [[[NSMutableString alloc]init]autorelease];
     
     static NSString *CellIdentifier = @"Cell";
     UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
 
     if(cell == nil) 
     {
         cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
     }
 
     /*tempArray = [self checkGPSAtIndex:indexPath]; 
     
     if(tempArray == nil)
     {
         cell.textLabel.text = @"";
         cell.detailTextLabel.text = @"";    
     }
     else
     {
     [tempString appendString:[tempArray objectAtIndex:0]];
     [tempString appendString:@";"];
     [tempString appendString:[tempArray objectAtIndex:1]];
     cell.textLabel.text = tempString;
     cell.detailTextLabel.text = [tempArray objectAtIndex:2];    
     }*/
     
     cell = [self LoadGPSWithCell:cell atIndexPath:indexPath];

     return cell;
 }

    //Latitude
    //Longitude

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 //Initialize the map view controller and display it.
 MapViewController *mapViewController = [[MapViewController alloc]initWithNibName:@"MapViewController" bundle:[NSBundle mainBundle]];
 //Get the selected 
 NSString *selectedRow = [_listData objectAtIndex:indexPath.row];

    if(selectedRow !=nil)
    {    
        mapViewController.selectedRow = selectedRow;
    }
    else
    {
        mapViewController.selectedRow = @"0.0;0.0;2010-1-1";
    }

// Pass the selected object to the new view controller.
[self.navigationController pushViewController:mapViewController animated:YES];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [super dealloc];
}

@end
