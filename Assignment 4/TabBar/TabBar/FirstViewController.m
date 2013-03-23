//
//  FirstViewController.m
//  TabBar
//
//  Created by Chao Zhao on 6/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "FirstTableViewController.h"

@implementation FirstViewController

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

-(IBAction)touch1:(id)sender
{
    FirstTableViewController *controller = [[FirstTableViewController alloc] initWithNibName:@"FirstTableViewController" bundle:nil];
    [[self navigationController] pushViewController:controller animated:YES];
    [controller release];
    controller = nil;   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload
{
    [super viewDidUnload];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

@end
